import 'package:flutter/material.dart';
import 'package:avaliacao/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginaCadastro extends StatefulWidget {
  PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  
  // use o ip do seu ambiente
  final String urlBase = 'https://steam-hnwe.onrender.com'; 

  String _avatarSelecionado = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYs4pmb7Aeah1Rc8Vto13x31sgcMgSEWa6Q&s'; // avatar padrao
  bool _carregando = false;

  final List<String> _opcoesDeAvatar = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYs4pmb7Aeah1Rc8Vto13x31sgcMgSEWa6Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLOljvgrfvr4w3JzeeUhm9evpP-m5qAqx5eQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHAgciJ8R37zy5V6yOFkyWuM7mOr_J4LSBWg&s',
  ];

  Future<void> _cadastrar() async {
    // remove espacos extras
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Por favor, preencha todos os campos!'),
            backgroundColor: Colors.redAccent),
      );
      return;
    }

    setState(() {
      _carregando = true;
    });

    final novoUsuario = Usuario(
      nome: nome,
      email: email,
      senha: senha,
      avatar: _avatarSelecionado,
    );

    try {
      // verifica se email existe
      final urlCheck = Uri.parse('$urlBase/usuarios?email=${novoUsuario.email}');
      final checkResponse = await http.get(urlCheck);
      
      if (checkResponse.statusCode == 200 && (json.decode(checkResponse.body) as List).isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este e-mail já está cadastrado.'), backgroundColor: Colors.redAccent),
        );
      } else {
        // enviar cadastro
        final response = await http.post(
          Uri.parse('$urlBase/usuarios'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(novoUsuario.toJson()),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cadastro realizado com sucesso!'), backgroundColor: Colors.green),
          );
          Navigator.pop(context);
        } else {
          throw Exception('Erro no servidor');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar ao servidor'), backgroundColor: Colors.redAccent),
      );
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Criar Conta',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Junte-se à maior comunidade gamer',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Escolha seu Avatar:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _opcoesDeAvatar.map((avatarUrl) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _avatarSelecionado = avatarUrl;
                    });
                  },
                  child: CircleAvatar(
                    radius: _avatarSelecionado == avatarUrl ? 35 : 30,
                    backgroundColor: _avatarSelecionado == avatarUrl
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
            SizedBox(height: 40),
            TextField(
              controller: _nomeController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _senhaController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1A2436),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _carregando ? null : _cadastrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: _carregando
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text('CADASTRAR',
                        style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
