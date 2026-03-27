import 'package:flutter/material.dart';

class Parte extends StatelessWidget {
  String img;
  String? texto;
  double largura;
  Parte({super.key, required this.img,  this.texto, required this.largura});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        spacing: 10,
        children: [
          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover), borderRadius: BorderRadius.circular(20)),

          ),
          Text(texto??"", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}