import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'cart_provider.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, dynamic> food;

  const FoodDetailPage(this.food, {super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = (quantity * widget.food['price']).toInt();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.food['image']),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.food['name'],
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("Rs. ${widget.food['price']} / per Portion"),
                  SizedBox(height: 10),
                  Text("Description",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                  SizedBox(height: 20),
                  Text("Customize your Order",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButtonFormField(
                    items: ['Small', 'Medium', 'Large']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    hint: Text("Select the size of portion"),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: ['Cheese', 'Olives', 'Mushrooms']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {},
                    hint: Text("Select the Ingredients"),
                  ),
                  SizedBox(height: 20),
                  Text("Number of Portions",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        onPressed: () {
                          setState(() => quantity++);
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price\nLKR $totalPrice",
                            style: TextStyle(color: Colors.white)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addItem(widget.food, quantity);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to cart')),
                            );
                          },
                          child: Text("Add to Cart",
                              style: TextStyle(color: Colors.orange)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
