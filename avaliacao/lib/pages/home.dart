import 'package:avaliacao/components/carrosel.dart';
import 'package:avaliacao/components/barra_pesquisa.dart';
import 'package:avaliacao/components/bemvindo.dart';
import 'package:avaliacao/pages/login.dart';
import 'package:avaliacao/services/local_database.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  final String nomeUsuario;
  final String avatarUrl;
  PaginaInicial({
    super.key,
    required this.nomeUsuario,
    required this.avatarUrl,
  });

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      appBar: AppBar(
        title: BarraPesquisa(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: PopupMenuButton<String>(
              icon: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.avatarUrl),
              ),
              color: Color(0xFF1A2436),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Sair'),
                ),
              ],
              onSelected: (value) {
                if (value == 'logout') {
                  LocalDatabase.limparUsuario();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PaginaLogin()),
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // usa nome do usuario logado
            CabecalhoSaudacao(nome: widget.nomeUsuario),
            Carrosel(titulo: 'Todos os Jogos'),
            Carrosel(categorias: ['RPG'], titulo: 'Melhores RPGs'),
            Carrosel(
              categorias: ['Tiro', 'FPS'],
              titulo: 'Jogos de Ação Intensa',
            ),
          ],
        ),
      ),
    );
  }
}
