import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User?> streamUser(String userId) {
    return _db
        .collection('apps/group-chat/users')
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.data() == null
          ? null
          : User.fromMap(snapshot.data()!, snapshot.id);
    });
  }

  Future<void> createOrUpdateUser(User user) async {
    Map<String, dynamic> userMap = user.toMap();
    await _db
        .collection('apps/group-chat/users')
        .doc(user.id)
        .set(userMap); // write to local cache immediately
  }

  Future<void> clearUserFcmToken(String userId) async {
    await _db.collection('apps/group-chat/users').doc(userId).update({
      'fcmToken': FieldValue.delete(),
      'lastLogout': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateUserOnlineStatus(String userId, bool isOnline) async {
    await _db.collection('apps/group-chat/users').doc(userId).update({
      'isOnline': isOnline,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Future<User?> getUserByEmail(String email) async {
    QuerySnapshot querySnapshot = await _db
        .collection('apps/group-chat/users')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return null;
    }
    return User.fromMap(querySnapshot.docs.first.data() as Map<String, dynamic>,
        querySnapshot.docs.first.id);
  }

  Future<void> updateUserFcmToken(String userId, String fcmToken) async {
    await _db
        .collection('apps/group-chat/users')
        .doc(userId)
        .update({'fcmToken': fcmToken});
  }

  Future<void> addUserFcmToken(String userId, String fcmToken) async {
    await _db.collection('apps/group-chat/users').doc(userId).update({
      'fcmTokens': FieldValue.arrayUnion([fcmToken])
    });
  }

  Future<void> removeUserFcmToken(String userId, String fcmToken) async {
    await _db.collection('apps/group-chat/users').doc(userId).update({
      'fcmTokens': FieldValue.arrayRemove([fcmToken])
    });
  }
}
