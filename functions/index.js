/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const admin = require('firebase-admin');

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

const firebaseConfig = {
    apiKey: "AIzaSyBigw7mJf0KYy4OBJv7Y6QI8nGDuDIXRbY",
    authDomain: "cs-322-0.firebaseapp.com",
    projectId: "cs-322-0",
    storageBucket: "cs-322-0.appspot.com",
    messagingSenderId: "416702487992",
    appId: "1:416702487992:web:45bb3fdfc16dc674cd434d",
    measurementId: "G-3NSQJDVRRL"
  };
  
admin.initializeApp(firebaseConfig);

const db = admin.firestore();

const labRef = db.collection('lab').doc('test');

exports.helloWorld = onRequest((request, response) => {
    console.log(request.query)
    labRef.set({
        current: request.query,
    }).then(()=>{
        response.send("its done");
    })
});
