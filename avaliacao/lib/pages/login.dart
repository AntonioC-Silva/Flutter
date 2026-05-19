import 'package:flutter/material.dart';
import 'package:avaliacao/navigation/NavBar.dart';
import 'package:avaliacao/pages/cadastro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:avaliacao/models/usuario.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  // use o ip do seu ambiente
  final String urlBase = 'http://172.24.96.1:3000';
  bool _carregando = false;

  Future<void> _login() async {
    FocusScope.of(context).unfocus(); // esconde o teclado
    String email = _emailController.text.trim();
    String senha = _senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _carregando = true;
    });

    try {
      // busca usuarios e filtra localmente
      final url = Uri.parse('$urlBase/usuarios');
      debugPrint('Buscando base de usuários em: $url');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // verifica email e senha
        final userMatches = data
            .where((u) => u['email'] == email && u['senha'] == senha)
            .toList();

        if (userMatches.isNotEmpty) {
          // usuario encontrado
          final usuarioLogado = Usuario.fromJson(
            userMatches.first as Map<String, dynamic>,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Bem-vindo, ${usuarioLogado.nome}!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BarraNavegacao(
                nomeUsuario: usuarioLogado.nome,
                avatarUrl: usuarioLogado.avatar,
              ),
            ),
          );
          return;
        } else {
          // usuario nao encontrado
          debugPrint(
            'Nenhum usuário encontrado no array local com essas credenciais.',
          );
          throw 'E-mail ou senha incorretos';
        }
      } else {
        throw 'Erro no servidor: ${response.statusCode}';
      }
    } catch (e) {
      debugPrint('Erro detalhado no login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C20),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/logo.png"), width: 100),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1A2436),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _carregando ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _carregando
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text(
                        'ENTRAR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaCadastro(),
                  ),
                );
              },
              child: const Text(
                'Criar conta',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
