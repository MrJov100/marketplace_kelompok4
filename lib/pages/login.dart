import 'package:flutter/material.dart';
import 'package:marketplace_kelompok4/pages/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.png"),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.w600, // Semibold
                  fontSize: 20.0, // Sesuaikan dengan kebutuhan
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Please enter the details below to\n                    continue",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Align(
                alignment: Alignment.centerLeft, // Align to left
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Email"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft, // Align to left
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
                    color: Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Password"),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 72, 69, 69)),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()))
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
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
