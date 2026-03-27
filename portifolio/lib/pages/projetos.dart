import 'package:flutter/material.dart';
import 'package:portifolio/components/menu.dart';
import 'package:portifolio/components/projeto.dart';

class Projetos extends StatelessWidget {
  Projetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Projetos",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        actions: [
          Menu(cor: Colors.white,), 
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          ProjetoCard(
            logo: "assets/lsafety.png",
            descricao: "O SafetySight tem como objetivo realizar a verificação se o usuário está utilizando EPIs a partir de uma IA, além de registrar dados como quais EPIs estavam sendo utilizados e qual era o colaborador, por meio de um QR Code único, enviando todas essas informações para uma plataforma onde o administrador poderá ter acesso aos dados.",
            foto: "assets/safety.jpg",
          ),
          ProjetoCard(
            logo: "assets/l3D.png",
            descricao: "3D.DIOS tem como objetivo facilitar a visualização e a interação de usuários da plataforma Dios da FCM a partir de um modelo 3D.",
            foto: "assets/3D.png",
          ),
          ProjetoCard(
            logo: "assets/spready.png",
            descricao: "Spready trata-se de uma automatização de filtragem de planilhas e geração de uma nova planilha com o conteúdo filtrado, além de uma verificação constante do estoque e notificação caso o mesmo seja zerado.",
            foto: "assets/fspready.jpg",
          ),
        ],
      ),
    );
  }
}