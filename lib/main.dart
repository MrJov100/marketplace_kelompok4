import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketplace_kelompok4/Admin/admin_login.dart';
import 'package:marketplace_kelompok4/pages/login.dart';
import 'package:marketplace_kelompok4/pages/onboarding.dart';
import 'package:marketplace_kelompok4/pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const Onboarding(),
    );
  }
}
