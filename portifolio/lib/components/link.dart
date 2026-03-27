import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class links extends StatelessWidget {
  Widget icone;
  String url;

   links({super.key, required this.icone, required this.url,});

  Future<void> _abrirLink() async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _abrirLink,
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset:  Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: icone), 
      ),
    );
  }
}