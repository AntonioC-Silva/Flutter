import 'package:avaliacao/models/jogo.dart';
import 'package:flutter/material.dart';

class GerenciamentoItemCard extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback aoEditar;
  final VoidCallback aoDeletar;

  const GerenciamentoItemCard({
    super.key,
    required this.jogo,
    required this.aoEditar,
    required this.aoDeletar,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          jogo.imagem,
          width: 50,
          height: 50,
          fit: BoxFit.cover, 
          errorBuilder: (_, __, ___) => const Icon(Icons.gamepad, color: Colors.white24),
        ),
      ),
      title: Text(jogo.nome, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text('R\$ ${jogo.valor.toStringAsFixed(2)}', style: const TextStyle(color: Colors.greenAccent)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blueAccent),
            onPressed: aoEditar,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: aoDeletar,
          ),
        ],
      ),
    );
  }
}