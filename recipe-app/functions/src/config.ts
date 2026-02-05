import { genkit } from 'genkit';
import { vertexAI } from '@genkit-ai/vertexai';

const firebaseConfig = {
  // TODO: add your firebase config here
  apiKey: "AIzaSyC7oeNXnGQEdksZJsVWiuOvnuEif81ky04",
  authDomain: "example-recipe-app-a9a76.firebaseapp.com",
  projectId: "example-recipe-app-a9a76",
  storageBucket: "example-recipe-app-a9a76.firebasestorage.app",
  messagingSenderId: "281869670516",
  appId: "1:281869670516:web:83b2cc0306df28370cd921"
};

export const getProjectId = () => firebaseConfig.projectId;

// enableFirebaseTelemetry({ projectId: getProjectId() });

export const ai = genkit({
  plugins: [
    vertexAI({
      projectId: getProjectId(),
      location: 'us-central1',
    }),
  ],
});
