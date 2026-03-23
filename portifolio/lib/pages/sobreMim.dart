import 'package:flutter/material.dart';
import 'package:portifolio/components/appbar.dart';
import 'package:portifolio/components/parte.dart';

class SobreMim extends StatelessWidget {
  const SobreMim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CONTEÚDO
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Parte(
                  img: "assets/Sobre.jpg",
                  texto: "Meu nome é Antônio e atualmente\ntenho 18 anos.",
                ),
              ],
            ),
          ),


          Positioned(top: 0, left: 0, right: 0, child: Nav(texto: "Sobre Mim")),
        ],
      ),
    );
  }
}
