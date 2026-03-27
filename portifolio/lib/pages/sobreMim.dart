import 'package:flutter/material.dart';
import 'package:portifolio/components/link.dart';
import 'package:portifolio/components/menu.dart'; 
import 'package:portifolio/components/parte.dart';
import 'package:portifolio/components/formacao.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SobreMim extends StatelessWidget {
  SobreMim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sobre Mim", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true, 
        backgroundColor: Colors.white,
        actions: [
          Menu(), 
        ],
      ),
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Padding(padding: EdgeInsetsGeometry.only(left: 10),
              child: Parte(largura: 100,
                img: "assets/Sobre.jpg",
                texto: "Meu nome é Antônio\nTenho 18 anos\nMoro em Campinas",
              ),
            ),


            
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              width: 390,
              height: 100,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2, 
                  blurRadius: 7,    
                ),
              ],
            ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Atualmente sou Aprendiz de Soluções Digitais\n na Bosch Campinas", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            ),
            
            SizedBox(height: 50,),
            FormacaoCard(
              titulo: "Formação Acadêmica",
              periodo1: "2023-2025",
              curso1: "Ensino Médio",
              periodo2: "2025-2026",
              curso2: "Senai - Curso Técnico",
            ),

            SizedBox(height: 40,),
            Text("Canais de Contato", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                links(icone: FaIcon(FontAwesomeIcons.linkedin,color: Colors.black, size: 40,), url: "https://www.linkedin.com/in/ant%C3%B4nio-rodrigues-6419922b7/"),
                links(icone: FaIcon(FontAwesomeIcons.instagram,color: Colors.black, size: 40,), url: "https://www.instagram.com/tonyx00_/"),
                links(icone: FaIcon(FontAwesomeIcons.github,color: Colors.black, size: 40,), url: "https://github.com/AntonioC-Silva"),
              ],
            ),

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}