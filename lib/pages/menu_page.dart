import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final categories = [
    {'title': 'Food', 'count': '120 items', 'img': 'assets/img/pizza.jpg'},
    {
      'title': 'Beverages',
      'count': '220 items',
      'img': 'assets/img/coffee.jpg'
    },
    {
      'title': 'Desserts',
      'count': '155 items',
      'img': 'assets/img/dessert.jpg'
    },
    {
      'title': 'Promotions',
      'count': '25 items',
      'img': 'assets/img/burger.jpg'
    },
  ];

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search food',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, index) {
                  final item = categories[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(item['img']!,
                            width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      title: Text(item['title']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item['count']!),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.orange),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
