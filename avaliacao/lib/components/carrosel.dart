import 'dart:convert';

import 'package:avaliacao/models/jogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'carrosel_card.dart';

class Carrosel extends StatefulWidget {
  final List<String>? categorias;
  final String? titulo;

  const Carrosel({super.key, this.categorias, this.titulo});

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
  late final Future<List<Jogo>> _jogosFuture;
  final PageController _pageController = PageController(viewportFraction: 0.78);

  @override
  void initState() {
    super.initState();
    _jogosFuture = carregarJogos();
  }

  Future<List<Jogo>> carregarJogos() async {
    final jsonString = await rootBundle.loadString('API/db.json');
    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    final jogos = data['jogos'] as List<dynamic>;
    final listaJogos = jogos.map((item) => Jogo.fromJson(item as Map<String, dynamic>)).toList();
    
    if (widget.categorias != null && widget.categorias!.isNotEmpty) {
      return listaJogos.where((jogo) {
        return jogo.categorias.any((categoria) => widget.categorias!.contains(categoria));
      }).toList();
    }
    
    return listaJogos;
  }

  String _getTitulo() {
    if (widget.titulo != null && widget.titulo!.isNotEmpty) {
      return widget.titulo!;
    }
    
    if (widget.categorias == null || widget.categorias!.isEmpty) {
      return 'Jogos em destaque';
    }
    
    if (widget.categorias!.length == 1) {
      return 'Jogos de ${widget.categorias!.first}';
    }
    
    return 'Jogos de ${widget.categorias!.join(', ')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      color: const Color(0xFF040C20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aqui',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _getTitulo(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder<List<Jogo>>(
            future: _jogosFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SizedBox(
                  height: 260,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.greenAccent,
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return SizedBox(
                  height: 260,
                  child: Center(
                    child: Text(
                      'Erro ao carregar jogos',
                      style: TextStyle(color: Colors.red[300]),
                    ),
                  ),
                );
              }

              final jogos = snapshot.data ?? [];
              if (jogos.isEmpty) {
                return const SizedBox(
                  height: 260,
                  child: Center(
                    child: Text(
                      'Nenhum jogo encontrado',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              }

              return SizedBox(
                height: 320,
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  pageSnapping: true,
                  itemCount: jogos.length,
                  itemBuilder: (context, index) {
                    return CarroselCard(jogo: jogos[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
