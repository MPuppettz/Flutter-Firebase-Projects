const { logger, https, HttpsError } = require("firebase-functions/v2");

const admin = require("firebase-admin");
const { FieldValue } = require("firebase-admin/firestore");
const {
  onDocumentCreated,
  onDocumentDeleted,
  onDocumentUpdated,
} = require("firebase-functions/v2/firestore");
const { user } = require("firebase-functions/v1/auth");

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
});
const db = admin.firestore();

// Subscribe a client to a topic. This is useful for web clients that can't subscribe to topics directly. By default, callable functions have CORS configured to allow requests from all origins. You can follow this link: https://firebase.google.com/docs/functions/callable?gen=2nd#cors to configure your own CORS rules.
exports.groupChatAppSubscribeToTopic = https.onCall(async (request) => {
  const { token, topic } = request.data;
  const uid = request.auth.uid;

  if (!uid) {
    logger.error(
      "groupChatAppSubscribeToTopic: Error: Client must log in first."
    );
    throw new HttpsError("failed-precondition", "Please log in first.");
  }

  try {
    await admin.messaging().subscribeToTopic(token, topic);

    logger.debug(
      `groupChatAppSubscribeToTopic: Successfully subscribed device with token: ${token} to topic: ${topic}`
    );

    return { message: `Subscribed to ${topic}` };
  } catch (error) {
    logger.error(
      "groupChatAppSubscribeToTopic: Error processing HTTP request",
      error
    );
    throw new HttpsError("internal", "Internal server error.");
  }
});

exports.groupChatAppUnsubscribeFromTopic = https.onCall(async (request) => {
  const { token, topic } = request.data;
  const uid = request.auth.uid;

  if (!uid) {
    logger.error(
      "groupChatAppUnsubscribeFromTopic: Error: Client must log in first."
    );
    throw new HttpsError("failed-precondition", "Please log in first.");
  }

  try {
    await admin.messaging().unsubscribeFromTopic(token, topic);
    logger.debug(
      `groupChatAppUnsubscribeFromTopic:  Successfully unsubscribed device with token: ${token} from topic: ${topic}`
    );
    return { message: `Unsubscribed from ${topic}` };
  } catch (error) {
    logger.error(
      "groupChatAppUnsubscribeFromTopic: Error processing HTTP request",
      error
    );
    throw new HttpsError("internal", "Internal server error.");
  }
});

exports.groupChatAppDeleteMessage = onDocumentDeleted(
  {
    document: "apps/group-chat/messages/{messageId}",
    region: "us-west1",
  },
  async (event) => {
    const messageId = event.params.messageId;
    const idempotencyRef = db.doc(
      `apps/group-chat/idempotencyKeys/delete_${event.id}`
    );

    try {
      await db.runTransaction(async (transaction) => {
        const idempotencyDoc = await transaction.get(idempotencyRef);
        if (idempotencyDoc.exists) {
          logger.info(
            "groupChatAppDeleteMessage: Event already processed, skipping"
          );
          return;
        }
        const snapshot = event.data;
        if (!snapshot || !snapshot.data()) {
          logger.error("groupChatAppDeleteMessage: No message data found");
          return;
        }

        const messageData = snapshot.data();
        const userId = messageData["userId"];

        if (!userId) {
          logger.error("groupChatAppDeleteMessage: No userId found in message data");
          return;
        }

        const userRef = db.doc(`apps/group-chat/users/${userId}`);
        const userDoc = await transaction.get(userRef);

        if (!userDoc.exists) {
          logger.error(`groupChatAppDeleteMessage: User document not found for userId: ${userId}`);
          return;
        }

        const userData = userDoc.data();
        const fcmToken = userData.fcmToken;

        if (!fcmToken) {
          logger.info(`groupChatAppDeleteMessage: No FCM token found for user: ${userId}`);
          return;
        }

        try {
          const response = await admin.messaging().send({
            token: fcmToken,
            notification: {
              title: 'Your message was deleted by moderator',
              body: messageData["text"] || 'Message content not available',
            },
            data: {
              function: "groupChatAppDeleteMessage",
              messageId: messageId,
              text: messageData["text"] || '',
              userId: userId,
              userName: messageData["userName"] || '',
            },
          });

          logger.info(`groupChatAppDeleteMessage: Notification sent successfully to user ${userId}`);
        } catch (messagingError) {
          logger.error(`groupChatAppDeleteMessage: Error sending notification to user ${userId}:`, messagingError);
          // Don't throw here - we still want to mark the event as processed
        }

        // Mark this event as processed
        transaction.set(idempotencyRef, {
          processedAt: FieldValue.serverTimestamp(),
          userId: userId,
          messageId: messageId
        });
      });
      logger.debug("groupChatAppDeleteMessage: Event processed successfully");
    } catch (error) {
      logger.error("groupChatAppDeleteMessage: Error processing event", error);
    }
  }
);

// REMOVED: groupChatAppPushMessage function - no notifications for new messages

// Set `isModerator` custom claim for the user if the `isModerator` doc field is set to true (in Firebase Console manually).
exports.groupChatAppSetModeratorCustomClaim = onDocumentUpdated(
  {
    document: "apps/group-chat/users/{userId}",
    region: "us-west1",
  },
  async (event) => {
    const userId = event.params.userId;
    const userData = event.data.after.data();

    // No idempoency check needed here as the logic of this function is idempotent
    try {
      // The custom claim is available in the user's ID token only after the next sign-in
      await admin.auth().setCustomUserClaims(userId, {
        isModerator: userData["isModerator"],
      });
    } catch (error) {
      logger.error(
        "groupChatAppSetModeratorCustomClaim: Error setting custom claim",
        error
      );
    }

    logger.debug(
      "groupChatAppSetModeratorCustomClaim: Event processed successfully"
    );
  }
);