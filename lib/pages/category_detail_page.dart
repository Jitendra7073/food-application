import 'package:flutter/material.dart';
import 'food_detail_page.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  CategoryDetailPage({super.key, required this.category});

  final List<Map<String, dynamic>> items = [
    {
      'name': 'French Apple Pie',
      'image': 'assets/img/dess_1.png',
      'price': 450,
      'subtitle': '4.9 • Minute by tuk tuk • Desserts',
    },
    {
      'name': 'Dark Chocolate Cake',
      'image': 'assets/img/dess_2.png',
      'price': 550,
      'subtitle': '4.7 • Cakes by Tella • Desserts',
    },
    {
      'name': 'Street Shake',
      'image': 'assets/img/dess_3.png',
      'price': 300,
      'subtitle': '4.9 • Café Racer • Desserts',
    },
    {
      'name': 'Fudgy Chewy Brownies',
      'image': 'assets/img/dess_4.png',
      'price': 500,
      'subtitle': '4.9 • Minute by tuk tuk • Desserts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Food",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodDetailPage(item),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(item['image'],
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity),
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text(item['subtitle'],
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
