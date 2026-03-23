import 'package:flutter/material.dart';

class Parte extends StatelessWidget {
  String img;
  String texto;
  Parte({super.key, required this.img, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        spacing: 10,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover), borderRadius: BorderRadius.circular(20)),

          ),
          Text(texto, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}