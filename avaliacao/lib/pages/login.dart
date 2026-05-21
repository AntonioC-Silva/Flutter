import 'package:flutter/material.dart';
import 'package:avaliacao/navigation/NavBar.dart';
import 'package:avaliacao/pages/cadastro.dart';
import 'package:avaliacao/services/local_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:avaliacao/models/usuario.dart';

class PaginaLogin extends StatefulWidget {
  PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool carregando = false;

  void fazerLogin() async {
    String email = emailController.text;
    String senha = senhaController.text;

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    setState(() {
      carregando = true;
    });

    try {
      final url = Uri.parse('http://10.91.40.0:3000/usuarios');
      final resposta = await http.get(url);

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body) as List;
        bool encontrou = false;
        Map<String, dynamic>? usuarioEncontrado;

        for (var item in dados) {
          if (item['email'] == email && item['senha'] == senha) {
            encontrou = true;
            usuarioEncontrado = item;
            break;
          }
        }

        if (encontrou && usuarioEncontrado != null) {
          final usuario = Usuario.fromJson(usuarioEncontrado);
          await LocalDatabase.salvarUsuario(usuario);

          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BarraNavegacao(
                nomeUsuario: usuario.nome,
                avatarUrl: usuario.avatar,
              ),
            ),
          );
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email ou senha incorretos')),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/logo.png'), width: 100),
            SizedBox(height: 40),
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1A2436),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: senhaController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1A2436),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: carregando ? null : fazerLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: carregando
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text('ENTRAR', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaginaCadastro(),
                  ),
                );
              },
              child: Text(
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
