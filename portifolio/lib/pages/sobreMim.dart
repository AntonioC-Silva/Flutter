import 'package:flutter/material.dart';
import 'package:portifolio/components/appbar.dart';


class SobreMim extends StatelessWidget {
  const SobreMim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            top: 0, 
            child: Nav(texto: "Sobre Mim")
          ),

        ],
      ),
    );
  }
}