import 'package:flutter/material.dart';

class BarraPesquisa extends StatelessWidget {
  final Function(String)? onChanged;
  
  const BarraPesquisa({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2436),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Procurar jogos...',
          hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.greenAccent, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}