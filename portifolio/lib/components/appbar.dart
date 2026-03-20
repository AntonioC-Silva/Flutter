import 'package:flutter/material.dart';
import 'package:portifolio/components/menu.dart';

class Nav extends StatelessWidget {
  final String texto;
  const Nav({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              Text(
                texto,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Positioned(
            right: 15,
            top: 10,
            child: Menu(),
          ),
        ],
      ),
    );
  }
}