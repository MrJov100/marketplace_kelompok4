import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/Admin/add_product.dart';
import 'package:marketplace_kelompok4/Admin/admin_login.dart';
import 'package:marketplace_kelompok4/Admin/all_order.dart';
import 'package:marketplace_kelompok4/Admin/home_admin.dart';
import 'package:marketplace_kelompok4/pages/onboarding.dart';


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
        home: AdminLogin());
  }
}
