import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/persona_model.dart';
import '../providers/persona_provider.dart';

class PersonaFormPage extends StatefulWidget {
  final Persona? persona;
  const PersonaFormPage({super.key, this.persona});

  @override
  State<PersonaFormPage> createState() => _PersonaFormPageState();
}

class _PersonaFormPageState extends State<PersonaFormPage> {
  final nombre = TextEditingController();
  final edad = TextEditingController();
  final correo = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.persona != null) {
      nombre.text = widget.persona!.nombre;
      edad.text = widget.persona!.edad.toString();
      correo.text = widget.persona!.correo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<PersonaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.persona == null ? 'Agregar Persona' : 'Editar Persona'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nombre, decoration: const InputDecoration(labelText: 'Nombre')),
            TextField(controller: edad, decoration: const InputDecoration(labelText: 'Edad'), keyboardType: TextInputType.number),
            TextField(controller: correo, decoration: const InputDecoration(labelText: 'Correo')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final persona = Persona(
                  id: widget.persona?.id,
                  nombre: nombre.text,
                  edad: int.parse(edad.text),
                  correo: correo.text,
                );

                widget.persona == null
                    ? provider.addPersona(persona)
                    : provider.updatePersona(persona);

                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}

