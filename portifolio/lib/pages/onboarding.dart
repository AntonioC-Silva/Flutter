import 'package:flutter/material.dart';
import 'package:portifolio/components/text.dart';
import 'package:portifolio/pages/sobreMim.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Texto(texto: "Olá, seja bem vindo ao meu Portifólio"),
            Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/eu.png"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(20)),
            ),
            Texto(texto: "Conheça sobre mim e os projetos \nnessa experiência"),

            TextButton(
              style: TextButton.styleFrom( 
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SobreMim()));
                }, child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),), ),
          ],
        ),
      )
    );
  }
}