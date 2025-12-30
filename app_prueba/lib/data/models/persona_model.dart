
class Persona {
  final String? id;
  final String nombre;
  final int edad;
  final String correo;

  Persona({
    this.id,
    required this.nombre,
    required this.edad,
    required this.correo,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['_id'],
      nombre: json['nombre'],
      edad: json['edad'],
      correo: json['correo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'edad': edad,
      'correo': correo,
    };
  }
}