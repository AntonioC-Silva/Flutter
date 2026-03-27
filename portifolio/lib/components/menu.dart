import 'package:flutter/material.dart';
import 'package:portifolio/pages/projetos.dart';
import 'package:portifolio/pages/sobreMim.dart';


class Menu extends StatelessWidget { 
  Color cor;
  Menu({super.key, this.cor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: cor,),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.person, color: Colors.black,),
            title: Text('Sobre Mim'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(context, MaterialPageRoute(builder: (context) => SobreMim()));
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.work, color: Colors.black,),
            title: Text('Projetos'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(context, MaterialPageRoute(builder: (context) => Projetos()));
            },
          ),
        ),
      ],
    );
  }
}