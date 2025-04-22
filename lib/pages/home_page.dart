import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning Akul',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your meal...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              SizedBox(height: 16),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('View All', style: TextStyle(color: Colors.orange)),
          ],
        ),
      );

  Widget _buildImageCard(String imgPath, String title) => Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(12),
        child: Text(
          title,
          style: TextStyle(
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
        subtitle: Text(price, style: TextStyle(color: Colors.orange)),
      );
}
