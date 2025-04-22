import 'package:flutter/material.dart';
import 'payment_details_page.dart';
import 'notification_page.dart';
import 'about_us_page.dart';
import 'inbox_page.dart';
import 'my_orders_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // TODO: Navigate to Cart Page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cart coming soon")),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTile(
            context: context,
            icon: Icons.payment,
            title: "Payment Details",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PaymentDetailsPage()),
            ),
          ),
          _buildTile(
            context: context,
            icon: Icons.receipt_long,
            title: "My Orders",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyOrdersPage()),
              );
            },
          ),
          _buildTile(
            context: context,
            icon: Icons.notifications,
            title: "Notifications",
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const Text("15",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            ),
          ),
          _buildTile(
            context: context,
            icon: Icons.mail_outline,
            title: "Inbox",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InboxPage()),
            ),
          ),
          _buildTile(
            context: context,
            icon: Icons.info_outline,
            title: "About Us",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutUsPage()),
            ),
          ),
          _buildTile(
            context: context,
            icon: Icons.receipt_long,
            title: "My Orders",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyOrdersPage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
