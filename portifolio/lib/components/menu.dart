import 'package:flutter/material.dart';
import 'package:portifolio/pages/projetos.dart';
import 'package:portifolio/pages/sobreMim.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 45,
        height: isExpanded ? 130 : 45, 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Container(
              width: 41,
              height: 41,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isExpanded ? Icons.close : Icons.menu,
                color: Colors.white,
                size: 20,
              ),
            ),

            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SobreMim()));},
                      child: const Icon(Icons.person, color: Colors.black, size: 24),
                    ),
                    
                    const SizedBox(height: 12), 
                    
                    GestureDetector(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Projetos()));},
                      child: const Icon(Icons.insert_drive_file, color: Colors.black, size: 24),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}