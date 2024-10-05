import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:marketplace_kelompok4/pages/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileChangee extends StatefulWidget {
  const ProfileChangee({super.key});

  @override
  State<ProfileChangee> createState() => _ProfileChangeeState();
}

class _ProfileChangeeState extends State<ProfileChangee> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  String? _gender = 'Male';
  bool _isLoading = false;
  String? _profileImage;
  String? _errorMessage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      birthdayController.text = prefs.getString('birthday') ?? '';
      _gender = prefs.getString('gender') ?? 'Male';
      _profileImage = prefs.getString('profileImage');
    });
  }

  Future<void> _saveProfileData() async {
    if (!validateEmail(emailController.text)) {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: _errorMessage.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }
    if (!validatePhone(phoneController.text)) {
      setState(() {
        _errorMessage = 'Please enter a valid phone number.';
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: _errorMessage.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setString('birthday', birthdayController.text);
    await prefs.setString('gender', _gender ?? 'Male');
    await prefs.setString('profileImage', _profileImage ?? '');

    setState(() {
      _isLoading = false;
      _errorMessage = null;
    });

    Fluttertoast.showToast(
      msg: "Profile updated successfully!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNav()),
    );
  }

  bool validateEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool validatePhone(String phone) {
    String pattern = r'^\d{10,15}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(phone);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthdayController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Account Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFfd6f3e),
        centerTitle: true,
      ),
      body: (_isLoading)
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildProfileForm(),
                              if (_errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 2));
                          await _saveProfileData();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 95),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFfd6f3e),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Text(
                            'Save Changes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFEFFFF),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ).animate().fadeIn(duration: 600.ms).slideY(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildProfileForm() {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: _selectImage,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFfd6f3e), width: 2),
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: _profileImage != null
                    ? FileImage(File(_profileImage!))
                    : const AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ).animate().fadeIn(duration: 500.ms).slideY(),
        ),
        _buildTextField(label: 'Name', controller: nameController),
        _buildTextField(label: 'Email', controller: emailController),
        _buildTextField(label: 'Phone', controller: phoneController),
        _buildTextField(label: 'Address', controller: addressController),
        _buildBirthdayField(),
        _buildGenderRadio(),
      ],
    );
  }

  Future<void> _selectImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile.path;
      });
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            maxLines: (label == "Address") ? 4 : null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Color(0xFFfd6f3e)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBirthdayField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birthday',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: birthdayController,
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Color(0xFFfd6f3e)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
