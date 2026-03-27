import 'package:flutter/material.dart';

class FormacaoCard extends StatelessWidget {
  final String titulo;
  final String periodo1;
  final String curso1;
  final String periodo2;
  final String curso2;

  const FormacaoCard({
    super.key,
    required this.titulo,
    required this.periodo1,
    required this.curso1,
    required this.periodo2,
    required this.curso2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40), 
          
          
          Stack(
            clipBehavior: Clip.none, 
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 2,
                color: Colors.white,
                width: double.infinity,
              ),
              
              
              Row(
                children: [
                  const SizedBox(width: 40), 
                  _buildPontoTimeline(periodo1, curso1),
                  const SizedBox(width: 150),
                  _buildPontoTimeline(periodo2, curso2),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPontoTimeline(String periodo, String curso) {
    return Stack(
      alignment: Alignment.center, 
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),

        Positioned(
          top: 20, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                periodo,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white),
              ),
              Text(
                curso,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 219, 217, 217), 
                  fontSize: 10
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}