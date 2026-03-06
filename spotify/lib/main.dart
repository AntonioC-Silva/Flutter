import 'package:flutter/material.dart';
import 'package:spotify/pages/onboarding.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial()
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Text("Spotify", style: TextStyle(color: Color(0xff1db954), fontSize: 50,  fontWeight: FontWeight.bold)),
            Container(
              margin: EdgeInsets.only(top: 110, bottom: 20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10),),
            ),


            SizedBox(height: 90),
            TextButton(
              style: TextButton.styleFrom( 
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              backgroundColor: Color(0xff1db954),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding()));
                }, child: Text("Começar", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),), ),

            
          ],
        )),
    );
  }
}