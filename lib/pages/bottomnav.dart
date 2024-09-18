import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/order.dart';
import 'package:marketplace_kelompok4/pages/profile.dart';
import 'home.dart';

class BottomNav extends StatefulWidget {
  final int initialTabIndex;

  const BottomNav({super.key, this.initialTabIndex = 0});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late Home homePage;
  late Order order;
  late Profile profile;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    homePage = const Home();
    order = Order();
    profile = Profile();
    pages = [homePage, order, profile];
    currentTabIndex = widget.initialTabIndex; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentTabIndex, 
        height: 65,
        backgroundColor: Color.fromARGB(237, 163, 185, 215),
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
