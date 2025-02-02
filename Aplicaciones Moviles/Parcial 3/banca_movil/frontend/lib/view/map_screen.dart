import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo principal negro
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        /* title: Text(
          "Ubicación ESPE",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ), */
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Toca para ver la ubicación",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _launchGoogleMaps,
              child: Lottie.asset(
                'ubi.json',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchGoogleMaps() async {
    const url = 'https://maps.app.goo.gl/KCseY3fRXznkNapPA';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir la URL: $url';
    }
  }
}
