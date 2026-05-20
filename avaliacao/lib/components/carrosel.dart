import 'dart:convert';

import 'package:avaliacao/models/jogo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'carrosel_card.dart';

class Carrosel extends StatefulWidget {
  final List<String>? categorias;
  final String titulo;

  const Carrosel({
    super.key,
    this.categorias,
    required this.titulo,
  });

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
  List<Jogo> jogos = [];
  bool carregando = true;
  bool temErro = false;
  String mensagemErro = '';

  @override
  void initState() {
    super.initState();
    buscarJogos();
  }

  void buscarJogos() async {
    try {
      final resposta = await http.get(Uri.parse('http://172.24.96.1:3000/jogos'));

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body) as List;
        List<Jogo> lista = [];

        for (var item in dados) {
          lista.add(Jogo.fromJson(item));
        }

        if (widget.categorias != null && widget.categorias!.isNotEmpty) {
          List<Jogo> filtrada = [];
          for (var jogo in lista) {
            for (var categoria in widget.categorias!) {
              if (jogo.categorias.contains(categoria)) {
                filtrada.add(jogo);
                break;
              }
            }
          }
          lista = filtrada;
        }

        if (mounted) {
          setState(() {
            jogos = lista;
            carregando = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            temErro = true;
            mensagemErro = 'Erro ${resposta.statusCode}';
            carregando = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          temErro = true;
          mensagemErro = 'Erro: $e';
          carregando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      color: const Color(0xFF040C20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          if (carregando)
            const SizedBox(
              height: 260,
              child: Center(
                child: CircularProgressIndicator(color: Colors.greenAccent),
              ),
            ),
          if (temErro)
            SizedBox(
              height: 260,
              child: Center(
                child: Text(
                  mensagemErro,
                  style: TextStyle(color: Colors.red[300]),
                ),
              ),
            ),
          if (!carregando && !temErro && jogos.isEmpty)
            const SizedBox(
              height: 260,
              child: Center(
                child: Text(
                  'Nenhum jogo encontrado',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          if (!carregando && !temErro && jogos.isNotEmpty)
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: jogos.length,
                itemBuilder: (context, index) {
                  return CarroselCard(jogo: jogos[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
