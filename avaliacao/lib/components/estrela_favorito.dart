import 'package:avaliacao/models/jogo.dart';
import 'package:avaliacao/services/local_database.dart';
import 'package:flutter/material.dart';

class EstrelaFavorito extends StatefulWidget {
  final Jogo jogo;
  const EstrelaFavorito({super.key, required this.jogo});

  @override
  State<EstrelaFavorito> createState() => _EstrelaFavoritoState();
}

class _EstrelaFavoritoState extends State<EstrelaFavorito> {
  bool isFavorito = false;

  @override
  void initState() {
    super.initState();
    verificarSeFavorito();
  }

  void verificarSeFavorito() async {
    final lista = await LocalDatabase.obterFavoritos();
    bool encontrou = false;

    for (var jogo in lista) {
      if (jogo.id == widget.jogo.id) {
        encontrou = true;
        break;
      }
    }

    if (mounted) {
      setState(() {
        isFavorito = encontrou;
      });
    }
  }

  void clicarEstrela() async {
    if (isFavorito) {
      await LocalDatabase.removerFavorito(widget.jogo.id);
    } else {
      await LocalDatabase.salvarFavorito(widget.jogo);
    }

    setState(() {
      isFavorito = !isFavorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorito ? Icons.star : Icons.star_border,
        color: isFavorito ? Colors.yellowAccent : Colors.white,
        size: 28,
      ),
      onPressed: clicarEstrela,
    );
  }
}
