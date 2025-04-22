import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...cart.items.map((item) => Card(
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 50),
                    title: Text(item['name']),
                    subtitle:
                        Text('Rs. ${item['price']} x ${item['quantity']}'),
                    trailing: Text('Rs. ${item['price'] * item['quantity']}'),
                  ),
                )),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Rs. ${cart.totalPrice}", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Proceeding to checkout...")),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50)),
              child: Text("Proceed to Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
