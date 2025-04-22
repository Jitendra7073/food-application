import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      final data = doc.data();
      if (data != null) {
        _nameController.text = data['name'] ?? '';
        _emailController.text = data['email'] ?? '';
        _mobileController.text = data['mobile'] ?? '';
        _addressController.text = data['address'] ?? '';
      }
    }
    setState(() => _isLoading = false);
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'mobile': _mobileController.text.trim(),
        'address': _addressController.text.trim(),
        'updatedAt': Timestamp.now(),
      });

      // If password was changed, update it
      if (_passwordController.text.trim().isNotEmpty &&
          _passwordController.text.trim() ==
              _confirmPasswordController.text.trim()) {
        await user.updatePassword(_passwordController.text.trim());
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            // Optionally navigate to login screen:
                            // Navigator.pushReplacementNamed(context, '/login');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : const AssetImage('assets/img/avatar.png')
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Column(
                              children: const [
                                Icon(Icons.edit, color: Colors.orange),
                                Text("Edit Profile",
                                    style: TextStyle(color: Colors.orange)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("Hi there, ${_nameController.text}!",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 20),
                    _buildTextField("Name", _nameController),
                    _buildTextField("Email", _emailController),
                    _buildTextField("Mobile No", _mobileController),
                    _buildTextField("Address", _addressController),
                    _buildTextField("New Password", _passwordController,
                        obscure: true),
                    _buildTextField(
                        "Confirm Password", _confirmPasswordController,
                        obscure: true),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Save", style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
