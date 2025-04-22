import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Who We Are",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "We are a passionate team building the best food delivery experience. "
              "Our mission is to connect people with the best restaurants in their city, "
              "delivering fresh and delicious meals right to their doorsteps.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: "support@fooddelivery.com",
            ),
            _buildInfoCard(
              icon: Icons.phone_outlined,
              title: "Phone",
              subtitle: "+1 (800) 123-4567",
            ),
            _buildInfoCard(
              icon: Icons.location_on_outlined,
              title: "Address",
              subtitle: "123 Foodie Lane, Flavor Town, USA",
            ),
            const Spacer(),
            Center(
              child: Text(
                "App Version 1.0.0",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
