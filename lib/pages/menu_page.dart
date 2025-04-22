import 'package:flutter/material.dart';
import 'category_detail_page.dart';

class MenuPage extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem("Food", "assets/img/menu_1.png", Colors.deepOrange),
    CategoryItem("Beverages", "assets/img/menu_2.png", Colors.teal),
    CategoryItem("Desserts", "assets/img/menu_3.png", Colors.purple),
    CategoryItem("Promotions", "assets/img/menu_4.png", Colors.blue),
  ];

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Menu",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search food, drinks...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return _buildCategoryCard(context, categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, CategoryItem item) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryDetailPage(category: item.name)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: item.color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item.image, height: 100),
              const SizedBox(height: 10),
              Text(item.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String image;
  final Color color;

  CategoryItem(this.name, this.image, this.color);
}
