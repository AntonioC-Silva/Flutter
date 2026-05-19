import 'package:avaliacao/pages/login.dart';
import 'package:flutter/material.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  // logica
  @override
  void initState() {
    // init splash
    super.initState();
    Future.delayed(
      // espera 2 segundos e navega
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PaginaLogin()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
