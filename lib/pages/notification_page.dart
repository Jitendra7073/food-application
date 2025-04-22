import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {
      "title": "Order Shipped",
      "subtitle": "Your order #2390 has been shipped.",
      "time": "2h ago",
      "icon": Icons.local_shipping,
      "iconColor": Colors.blue,
    },
    {
      "title": "New Offer",
      "subtitle": "Get 20% off on your next order!",
      "time": "5h ago",
      "icon": Icons.local_offer,
      "iconColor": Colors.green,
    },
    {
      "title": "Order Delivered",
      "subtitle": "Order #2389 was delivered successfully.",
      "time": "Yesterday",
      "icon": Icons.check_circle,
      "iconColor": Colors.orange,
    },
    {
      "title": "Welcome!",
      "subtitle": "Thanks for joining our app!",
      "time": "2 days ago",
      "icon": Icons.celebration,
      "iconColor": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              // Add clear notification logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("All notifications cleared")),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final item = _notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item['iconColor'].withOpacity(0.2),
                child: Icon(item['icon'], color: item['iconColor']),
              ),
              title: Text(item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['subtitle']),
              trailing: Text(item['time'],
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
