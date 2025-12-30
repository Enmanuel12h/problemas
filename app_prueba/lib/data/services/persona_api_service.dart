
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/api_config.dart';
import '../../core/token_storage.dart';
import '../models/persona_model.dart';

class PersonaApiService {
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenStorage.token}',
      };

  Future<List<Persona>> getPersonas() async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/personas'),
      headers: _headers,
    );

    final decoded = json.decode(response.body);

    
    if (response.statusCode != 200) {
      throw Exception(decoded['mensaje'] ?? 'Error al obtener personas');
    }

  
    return (decoded as List)
        .map((e) => Persona.fromJson(e))
        .toList();
  }

  Future<void> addPersona(Persona p) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/personas'),
      headers: _headers,
      body: json.encode(p.toJson()),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      final decoded = json.decode(response.body);
      throw Exception(decoded['mensaje'] ?? 'Error al crear persona');
    }
  }

  Future<void> updatePersona(Persona p) async {
    final response = await http.put(
      Uri.parse('${ApiConfig.baseUrl}/personas/${p.id}'),
      headers: _headers,
      body: json.encode(p.toJson()),
    );

    if (response.statusCode != 200) {
      final decoded = json.decode(response.body);
      throw Exception(decoded['mensaje'] ?? 'Error al actualizar persona');
    }
  }

  Future<void> deletePersona(String id) async {
    final response = await http.delete(
      Uri.parse('${ApiConfig.baseUrl}/personas/$id'),
      headers: _headers,
    );

    if (response.statusCode != 200) {
      final decoded = json.decode(response.body);
      throw Exception(decoded['mensaje'] ?? 'Error al eliminar persona');
    }
  }
}