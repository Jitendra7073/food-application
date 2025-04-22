import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  final offers = [
    {'img': 'assets/img/offer_1.jpg', 'title': 'Café de Noires'},
    {'img': 'assets/img/offer_2.jpg', 'title': 'Isso'},
    {'img': 'assets/img/offer_3.jpg', 'title': 'Cafe Beans'},
  ];

  OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Latest Offers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Find discounts, Offers special meals and more!'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, shape: StadiumBorder()),
              child: Text('Check Offers'),
            ),
            SizedBox(height: 20),
            ...offers.map((item) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(item['img']!, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 8),
                      Text(item['title']!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 16),
                          SizedBox(width: 4),
                          Text('4.9 (124 ratings) Café · Western Food'),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
