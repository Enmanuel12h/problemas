const express = require('express');
const router = express.Router();
const controller = require('../controllers/persona.controller');
const authRoutes = require('./src/routes/auth.routes');
const personaRoutes = require('./src/routes/Persona.routes');
router.use(auth);

router.get('/', controller.getPersonas);
router.post('/', controller.createPersona);
router.put('/:id', controller.updatePersona);
router.delete('/:id', controller.deletePersona);

module.exports = router;