import 'package:avaliacao/components/carrosel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C20),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF0A1931),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Carrosel(titulo: 'Todos os Jogos'), // Todos os jogos com título personalizado
            SizedBox(height: 20),
            Carrosel(categorias: ['RPG'], titulo: 'Melhores RPGs'), // RPGs com título personalizado
            SizedBox(height: 20),
            Carrosel(categorias: ['Tiro', 'FPS'], titulo: 'Jogos de Ação Intensa'), // Tiro/FPS com título personalizado
          ],
        ),
      ),
    );
  }
}
