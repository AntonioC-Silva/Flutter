import 'package:flutter/material.dart';
import 'package:avaliacao/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  
  // COLOQUE SEU IP AQUI
  final String urlBase = 'http://localhost:3000'; 

  String _selectedAvatar = 'https://i.pravatar.cc/150?u=avatar1'; // Avatar padrão
  bool _isLoading = false;

  final List<String> _avatarOptions = [
    'https://i.pravatar.cc/150?u=avatar1',
    'https://i.pravatar.cc/150?u=avatar2',
    'https://i.pravatar.cc/150?u=avatar3',
  ];

  Future<void> _cadastrar() async {
    if (_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _senhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Preencha todos os campos!'),
            backgroundColor: Colors.redAccent),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final novoUsuario = Usuario(
      nome: _nomeController.text,
      email: _emailController.text,
      senha: _senhaController.text,
      avatar: _selectedAvatar,
    );

    try {
      // Verificar se email existe
      final checkResponse = await http.get(Uri.parse('$urlBase/usuarios?email=${novoUsuario.email}'));
      final List<dynamic> data = json.decode(checkResponse.body);
      
      if (data.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este e-mail já está cadastrado.'), backgroundColor: Colors.redAccent),
        );
      } else {
        // Realizar cadastro
        final response = await http.post(
          Uri.parse('$urlBase/usuarios'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(novoUsuario.toJson()),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cadastro realizado com sucesso!'), backgroundColor: Colors.green),
          );
          Navigator.pop(context);
        } else {
          throw Exception('Erro no servidor');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao conectar ao servidor'), backgroundColor: Colors.redAccent),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              'Criar Conta',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Junte-se à maior comunidade gamer',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'Escolha seu Avatar:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _avatarOptions.map((avatarUrl) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = avatarUrl;
                    });
                  },
                  child: CircleAvatar(
                    radius: _selectedAvatar == avatarUrl ? 35 : 30,
                    backgroundColor: _selectedAvatar == avatarUrl
                        ? Colors.greenAccent
                        : Colors.transparent,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _nomeController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _senhaController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _cadastrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text('CADASTRAR',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}