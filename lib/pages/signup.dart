import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/bottomnav.dart';
import 'package:marketplace_kelompok4/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: 50.0, left: 20.0, right: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/signup.png"),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Please enter the details below to\n                    continue",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Name"),
                ),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Email"),
                ),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Password"),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: _signUp,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 72, 69, 69),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()))
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
