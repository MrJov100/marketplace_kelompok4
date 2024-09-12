import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/bottomnav.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          },
        ),
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFFfd6f3e),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/icon2.png',
                    height: 100,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'images/untar-logo.png',
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'KELOMPOK 4\nPROJECT MARKETPLACE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '535230006  Jessen Ericko\n'
                '535230013  Brandon Emmanuel\n'
                '535230027  Jovandi Todana\n'
                '535230031  Heru Purnomo\n'
                '535230110  Adidtiya Kurniawan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              const Spacer(),
              const Text(
                '© 2024 marketplace_kelompok4. All rights reserved\n| Developed by Kelompok 4 |',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
