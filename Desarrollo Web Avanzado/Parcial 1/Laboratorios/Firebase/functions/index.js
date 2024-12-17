const functions = require('firebase-functions');
const admin = require("firebase-admin");
const express = require('express');
const bodyParser = require('body-parser');
const serviceAccount = require("./permisos.json");

const app = express();

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

app.use(bodyParser.json());

app.get('/hello-world', (req, res) => {
    res.send('Hello World');
});

app.post('/api/products', async (req, res) => {
    try {
        if (!req.body.id || !req.body.name) {
            return res.status(400).send({error: 'ID and Name are required'});
        }

        await db.collection('products')
            .doc(req.body.id)
            .set({name: req.body.name});

        return res.status(204).send();
    } catch (error) {
        console.error("Error adding document: ", error);
        return res.status(500).send({error: 'Internal Server Error'});
    }
});

exports.app = functions.https.onRequest(app);