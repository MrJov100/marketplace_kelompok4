import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketplace_kelompok4/pages/profile_change.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'User';
  String email = 'user@gmail.com';
  String phone = '123-456-7890';
  String address = '123 Main Street, City';
  String birthday = '2024-07-17';
  String gender = 'Male';
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'User';
      email = prefs.getString('email') ?? 'user@gmail.com';
      phone = prefs.getString('phone') ?? '1234567890';
      address = prefs.getString('address') ?? '123 Main Street, City';
      birthday = prefs.getString('birthday') ?? '2024-07-17';
      gender = prefs.getString('gender') ?? 'Male';
      profileImageUrl = prefs.getString('profileImage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFD6F3E),
        elevation: 2,
        title: const Text(
          'Account Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: (profileImageUrl != null)
                            ? FileImage(File(profileImageUrl!))
                            : AssetImage('images/boy.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildAnimatedInfoField(label: 'Name', value: name),
                    _buildAnimatedInfoField(label: 'Email', value: email),
                    _buildAnimatedInfoField(label: 'Phone', value: phone),
                    _buildAnimatedInfoField(label: 'Address', value: address),
                    _buildAnimatedInfoField(label: 'Birthday', value: birthday),
                    _buildAnimatedInfoField(label: 'Gender', value: gender),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileChangee()),
                        );
                      },
                      child: Animate(
                        effects: [
                          FadeEffect(
                              duration: const Duration(milliseconds: 300)),
                          ScaleEffect(
                              duration: const Duration(milliseconds: 300)),
                        ],
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFD6F3E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Edit Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedInfoField({
    required String label,
    required String value,
  }) {
    return Animate(
      effects: [
        FadeEffect(duration: const Duration(milliseconds: 300)),
        MoveEffect(
          begin: const Offset(0, 10),
          end: Offset.zero,
          duration: const Duration(milliseconds: 300),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
