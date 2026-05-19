import 'package:avaliacao/components/carrosel.dart';
import 'package:avaliacao/components/barra_pesquisa.dart';
import 'package:avaliacao/components/bemvindo.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  final String nomeUsuario;
  final String avatarUrl;
  const PaginaInicial({
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
      backgroundColor: const Color(0xFF040C20),
      appBar: AppBar(
        title: const BarraPesquisa(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              // usa avatar do usuario logado
              radius: 18,
              backgroundImage: NetworkImage(widget.avatarUrl),
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
            const Carrosel(titulo: 'Todos os Jogos'),
            const Carrosel(categorias: ['RPG'], titulo: 'Melhores RPGs'),
            const Carrosel(
              categorias: ['Tiro', 'FPS'],
              titulo: 'Jogos de Ação Intensa',
            ),
          ],
        ),
      ),
    );
  }
}
