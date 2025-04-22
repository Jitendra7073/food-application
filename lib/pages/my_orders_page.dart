import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  final List<Map<String, dynamic>> _orders = const [
    {
      "id": "#1023",
      "restaurant": "Burger Spot",
      "items": "2 Burgers, 1 Fries",
      "status": "Delivered",
      "time": "Today, 1:20 PM",
    },
    {
      "id": "#1022",
      "restaurant": "Pizza Heaven",
      "items": "1 Large Pizza",
      "status": "In Progress",
      "time": "Yesterday, 7:10 PM",
    },
    {
      "id": "#1021",
      "restaurant": "Noodle Box",
      "items": "2 Noodle Bowls",
      "status": "Cancelled",
      "time": "Apr 18, 6:45 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.orange.shade100,
                child: const Icon(Icons.receipt_long, color: Colors.orange),
              ),
              title: Text("${order['restaurant']} • ${order['id']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(order['items']),
                  const SizedBox(height: 4),
                  Text(order['time'],
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              trailing: _buildStatus(order['status']),
              onTap: () {
                // TODO: Navigate to order detail screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Opening ${order['id']}")),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatus(String status) {
    Color color;
    switch (status) {
      case "Delivered":
        color = Colors.green;
        break;
      case "In Progress":
        color = Colors.orange;
        break;
      case "Cancelled":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style:
            TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
