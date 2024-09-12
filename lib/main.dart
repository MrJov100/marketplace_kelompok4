import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/bottomnav.dart';
import 'package:marketplace_kelompok4/pages/home.dart';
import 'package:marketplace_kelompok4/pages/onboarding.dart';
import 'package:marketplace_kelompok4/pages/product_detail.dart';
import 'package:marketplace_kelompok4/pages/product_detail.dart';
import 'package:marketplace_kelompok4/pages/payment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Project Marketplace Kelompok 4',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNav());
  }
}
