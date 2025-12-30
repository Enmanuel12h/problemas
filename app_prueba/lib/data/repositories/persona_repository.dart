
import '../models/persona_model.dart';
import '../services/persona_api_service.dart';

class PersonaRepository {
  final PersonaApiService api;

  PersonaRepository(this.api);

  Future<List<Persona>> getPersonas() => api.getPersonas();

  Future<void> addPersona(Persona p) => api.addPersona(p);

  Future<void> updatePersona(Persona p) => api.updatePersona(p);

  Future<void> deletePersona(String id) => api.deletePersona(id);
}