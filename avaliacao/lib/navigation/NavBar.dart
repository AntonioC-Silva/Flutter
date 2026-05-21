import 'package:flutter/material.dart';
import 'package:avaliacao/pages/favoritos.dart';
import 'package:avaliacao/pages/home.dart';
import 'package:avaliacao/pages/gerenciamento_jogos.dart';

class BarraNavegacao extends StatefulWidget {
  final String nomeUsuario;
  final String avatarUrl;
  BarraNavegacao({
    super.key,
    this.nomeUsuario = 'Jogador',
    this.avatarUrl = 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
  });

  @override
  State<BarraNavegacao> createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao> {
  // logica de navegacao
  int indexAtual = 0; // indice da tela selecionada
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      PaginaInicial(
        nomeUsuario: widget.nomeUsuario,
        avatarUrl: widget.avatarUrl,
      ),
      TelaGerenciamentoJogos(), // tela de gerenciamento de jogos
      FavoritosPage(),
    ];
  }

  void i(int novoIndex) {
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 31, 31, 32),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: Color.fromARGB(255, 31, 31, 32),
            label: "Gerenciar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            backgroundColor: Color.fromARGB(255, 31, 31, 32),
            label: "Favoritos",
          ),
        ],
        backgroundColor: Color.fromARGB(255, 31, 31, 32),
        selectedItemColor: Color.fromARGB(255, 1, 141, 255),
        unselectedItemColor: Colors.grey[400],
        unselectedIconTheme: IconThemeData(color: Colors.grey[400]),

        currentIndex: indexAtual,
        onTap: i,
      ),
    );
  }
}
