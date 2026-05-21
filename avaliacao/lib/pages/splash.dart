import 'package:avaliacao/pages/login.dart';
import 'package:avaliacao/navigation/NavBar.dart';
import 'package:avaliacao/services/local_database.dart';
import 'package:flutter/material.dart';

class TelaSplash extends StatefulWidget {
  TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    super.initState();
    verificarLogin();
  }

  void verificarLogin() async {
    await Future.delayed(Duration(seconds: 2));

    final usuario = await LocalDatabase.obterUsuario();

    if (!mounted) return;

    if (usuario != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BarraNavegacao(
            nomeUsuario: usuario.nome,
            avatarUrl: usuario.avatar,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaginaLogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
