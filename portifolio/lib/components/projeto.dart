import 'package:flutter/material.dart';

class ProjetoCard extends StatelessWidget {
  String logo;
  String descricao;
  String foto;

  ProjetoCard({super.key, required this.logo, required this.descricao, required this.foto,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          maintainState: true,
          shape:  RoundedRectangleBorder(side: BorderSide.none),
          collapsedShape:  RoundedRectangleBorder(side: BorderSide.none),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.white,

          title: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              logo,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),


          children: [
            Padding(
              padding:  EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    descricao,
                    textAlign: TextAlign.justify,
                    style:  TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                   SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      foto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}