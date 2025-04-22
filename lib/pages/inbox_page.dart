import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  final List<Map<String, dynamic>> _messages = const [
    {
      "name": "Support Team",
      "message": "Your order #2391 has been received. Thank you!",
      "time": "2 min ago",
      "avatar": "🛎️",
      "unread": true,
    },
    {
      "name": "Restaurant Delight",
      "message": "We're preparing your order now. Stay tuned!",
      "time": "10 min ago",
      "avatar": "🍽️",
      "unread": false,
    },
    {
      "name": "Promo Bot",
      "message": "20% off on all burgers this weekend only!",
      "time": "1h ago",
      "avatar": "🎁",
      "unread": true,
    },
    {
      "name": "Delivery Driver",
      "message": "I'm outside with your order 😊",
      "time": "1 day ago",
      "avatar": "🚗",
      "unread": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("All messages marked as read")),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final msg = _messages[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: msg['unread'] ? 3 : 1,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.orange.shade50,
                child:
                    Text(msg['avatar'], style: const TextStyle(fontSize: 22)),
              ),
              title: Text(
                msg['name'],
                style: TextStyle(
                  fontWeight: msg['unread'] ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              subtitle: Text(
                msg['message'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg['time'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  if (msg['unread'])
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
              onTap: () {
                // TODO: Navigate to full message thread or detail screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Opening message from ${msg['name']}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
