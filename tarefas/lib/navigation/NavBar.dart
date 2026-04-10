import 'package:flutter/material.dart';
import 'package:tarefas/pages/teladelete.dart';
import 'package:tarefas/pages/telaget.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // faça sua logica aqui
  int indexAtual = 0; // ver a tela q ta selecioanada
  List pages =[
    TelaGet(),
    TelaDelete()
  ];
  
  void i(int novoIndex){
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.get_app, color: Colors.white,), backgroundColor: Colors.lightBlue, label: "GET"),
        BottomNavigationBarItem(icon: Icon(Icons.delete_outline, color: Colors.white,),  backgroundColor: Colors.lightBlue, label: "DELETE",),
      ],
      backgroundColor: Colors.lightBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),

  
      currentIndex: indexAtual,
      onTap: i,
      ),
    );
  }
}