const Persona = require('../models/Persona');

exports.getPersonas = async (req, res) => {
  const personas = await Persona.find();
  res.json(personas);
};

exports.createPersona = async (req, res) => {
  const persona = new Persona(req.body);
  await persona.save();
  res.status(201).json(persona);
};

exports.updatePersona = async (req, res) => {
  const persona = await Persona.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );
  res.json(persona);
};

exports.deletePersona = async (req, res) => {
  await Persona.findByIdAndDelete(req.params.id);
  res.json({ mensaje: 'Persona eliminada' });
};
