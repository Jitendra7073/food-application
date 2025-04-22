import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'location_picker_page.dart'; // Make sure this path is correct

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userAddress = 'Select your delivery address';

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  Future<void> _loadAddress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      setState(() {
        _userAddress = snap['address'] ?? 'Select your delivery address';
      });
    }
  }

  Future<void> _navigateToLocationPicker() async {
    final selectedAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LocationPickerPage()),
    );

    if (selectedAddress != null) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({'address': selectedAddress}, SetOptions(merge: true));
        setState(() => _userAddress = selectedAddress);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _navigateToLocationPicker,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.orange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _userAddress,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Good morning Akul',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your meal...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              _sectionTitle('Popular Restaurants'),
              _buildImageCard('assets/img/pizza.jpg', 'Milano Pizza'),
              _buildImageCard('assets/img/breakfast.jpg', 'Café & Bites'),
              _buildImageCard('assets/img/burger.jpg', 'Burger King'),
              _sectionTitle('Most Popular'),
              _buildImageCard('assets/img/can_be_pizza.jpg', 'Can Be Pizza'),
              _buildImageCard('assets/img/burger_king.jpg', 'Burger By BK'),
              _sectionTitle('Recent Items'),
              _buildListItem(
                  'Mafioso Pizza by Josh', '\$8.50', 'assets/img/pizza.jpg'),
              _buildListItem(
                  'Frost Black Max', '\$6.30', 'assets/img/coffee.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('View All', style: TextStyle(color: Colors.orange)),
          ],
        ),
      );

  Widget _buildImageCard(String imgPath, String title) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black45),
        ),
      );

  Widget _buildListItem(String title, String price, String imgPath) => ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imgPath, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(title),
        subtitle: Text(price, style: const TextStyle(color: Colors.orange)),
      );
}
