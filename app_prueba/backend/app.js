const express = require('express');
const cors = require('cors');

const authRoutes = require('./src/routes/auth.routes.js');
const personaRoutes = require('./src/routes/persona.routes.js');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/auth', authRoutes);
app.use('/personas', personaRoutes);

module.exports = app;
