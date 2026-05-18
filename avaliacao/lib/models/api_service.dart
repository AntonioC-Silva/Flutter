import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:avaliacao/models/usuario.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost:3000'; // Altere para o IP da sua máquina se estiver testando em dispositivo físico

  Future<Usuario?> login(String email, String senha) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/usuarios?email=$email&senha=$senha'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return Usuario.fromJson(data.first as Map<String, dynamic>);
        }
      }
      return null; // Usuário não encontrado ou credenciais incorretas
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  Future<Usuario?> cadastrar(Usuario usuario) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/usuarios'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(usuario.toJson()),
      );

      if (response.statusCode == 201) {
        return Usuario.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        print('Erro ao cadastrar: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Erro ao cadastrar: $e');
      return null;
    }
  }

  Future<bool> verificarEmailExistente(String email) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/usuarios?email=$email'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.isNotEmpty;
      }
      return false;
    } catch (e) {
      print('Erro ao verificar email: $e');
      return false;
    }
  }
}