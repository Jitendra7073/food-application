import 'package:flutter/material.dart';
import 'add_card_form.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  bool isCashSelected = true;
  bool isCardAdded = true;

  void _showAddCardForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const AddCardForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Customize your payment method",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isCashSelected,
                  onChanged: (value) {
                    setState(() {
                      isCashSelected = value!;
                    });
                  },
                ),
                const Text("Cash/Card on delivery"),
              ],
            ),
            const SizedBox(height: 10),
            if (isCardAdded)
              Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Image.asset('assets/visa.png',
                      width: 40), // Replace with actual image
                  title: const Text("**** **** **** 2187"),
                  trailing: TextButton(
                    onPressed: () {
                      setState(() {
                        isCardAdded = false;
                      });
                    },
                    child: const Text("Delete Card",
                        style: TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            GestureDetector(
              onTap: _showAddCardForm,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "+ Add Another Credit/Debit Card",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
