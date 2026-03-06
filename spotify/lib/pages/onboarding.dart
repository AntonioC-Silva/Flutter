import 'package:flutter/material.dart';
import 'package:spotify/main.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<String> listaDeImagens = [
    'assets/carrosel1.png',
    'assets/carrosel2.png',
    'assets/carrosel3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Text("Onboarding", style: TextStyle(color: Color(0xff1db954), fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xff121212),),

      body: Center(
        child: Column(
          children: [

            SizedBox(height: 60),
            Text("Seja bem vindo ao nosso app!", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal)),

            
            SizedBox(height: 60),
            SizedBox(
            height: 350,
            width: 300,
            child: PageView.builder(
              itemCount: listaDeImagens.length,
              controller: PageController(viewportFraction: 0.9), // deixar o ladinho da img
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), 
                    child: Image.asset(
                      listaDeImagens[index],
                      fit: BoxFit.cover,
                      ),
                  ),
                  );
                },
              ),
            ),

            SizedBox(height: 60),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
                child: Text("Sua vida tem trilha sonora, e o Spotify sabe qual é.\nAqui você será expostos a um mundo de descobertas musicais", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal)),
            ),

            SizedBox(height: 60),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff1db954),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Text("Próximo", style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}