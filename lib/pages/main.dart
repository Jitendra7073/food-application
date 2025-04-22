import 'package:flutter/material.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'offers_page.dart';
import 'profile_page.dart';
import 'more_page.dart'; // Import MorePage

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 2; // Default selected tab (Home)

  // List of pages corresponding to the bottom navigation items
  final List<Widget> _pages = [
    MenuPage(),
    OffersPage(),
    HomePage(),
    const ProfilePage(),
    const MorePage(),
  ];

  // Handles navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle item taps
        selectedItemColor: Colors.orange, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
