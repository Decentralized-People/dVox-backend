const functions = require('firebase-functions');
const admin = require("firebase-admin");

admin.initializeApp(functions.config().firebase);


// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.topic_PublicLocation = functions.firestore.document("Notifications/PublicLocation").onWrite(async (event) => {
  // let docID = event.after.id
  const title = event.after.get("title");
  const content = event.after.get("content");

  const message = {
    notification: {
      title: title,
      body: content
    },
    topic: "PublicLocation",
  };

  setTimeout(async() => {
    const response = await admin.messaging().send(message)
    console.log(response);
  } , 10000)

});

exports.topic_KalamazooCollege = functions.firestore.document("Notifications/KalamazooCollege").onWrite(async (event) => {
  // let docID = event.after.id
  const title = event.after.get("title");
  const content = event.after.get("content");

  const message = {
    notification: {
      title: title,
      body: content
    },
    topic: "KalamazooCollege",
  };

  setTimeout(async() => {
    const response = await admin.messaging().send(message)
    console.log(response);
  } , 10000)
  
});
