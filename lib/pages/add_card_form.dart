import 'package:flutter/material.dart';

class AddCardForm extends StatelessWidget {
  const AddCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Add Credit/Debit Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildTextField("Card Number"),
            Row(
              children: [
                Expanded(child: _buildTextField("MM")),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField("YY")),
              ],
            ),
            _buildTextField("Security Code"),
            _buildTextField("First Name"),
            _buildTextField("Last Name"),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("You can remove this card at anytime"),
                const Spacer(),
                Switch(value: true, onChanged: (_) {}),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("+ Add Card",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
