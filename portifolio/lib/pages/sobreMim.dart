import 'package:flutter/material.dart';
import 'package:portifolio/components/menu.dart'; 
import 'package:portifolio/components/parte.dart';
import 'package:portifolio/components/formacao.dart';

class SobreMim extends StatelessWidget {
  const SobreMim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sobre Mim"),
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
            Parte(largura: 100,
              img: "assets/Sobre.jpg",
              texto: "Meu nome é Antônio\natualmente tenho 18 anos.",
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

          ],
        ),
      ),
    );
  }
}