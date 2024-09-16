import 'package:flutter/material.dart';
import 'home_admin.dart'; // Import file HomeAdmin

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80), 
              Image.asset(
                'assets/images/admin_login.png', 
                height: 200,
              ),
              SizedBox(height: 30), 
              Text(
                'Admin Panel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true, 
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username.isEmpty || password.isEmpty) {
                    setState(() {
                      _errorMessage = 'Username atau Password tidak boleh kosong!';
                    });
                  } else if (username == "Admin" && password == "Admin") {
                    setState(() {
                      _errorMessage = ''; 
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeAdmin()),
                    );
                  } else {
                    setState(() {
                      _errorMessage = 'Username atau Password salah!';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
