
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/persona_provider.dart';
import 'persona_form_page.dart';

class PersonaListPage extends StatefulWidget {
  const PersonaListPage({super.key});

  @override
  State<PersonaListPage> createState() => _PersonaListPageState();
}

class _PersonaListPageState extends State<PersonaListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PersonaProvider>().loadPersonas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PersonaProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Personas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PersonaFormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.personas.length,
              itemBuilder: (_, i) {
                final p = provider.personas[i];
                return ListTile(
                  title: Text(p.nombre),
                  subtitle: Text('${p.edad} años - ${p.correo}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PersonaFormPage(persona: p),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.deletePersona(p.id!);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
