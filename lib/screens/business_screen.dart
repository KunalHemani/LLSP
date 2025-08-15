import 'package:flutter/material.dart';
import 'package:llsps_new/models/business_user_model.dart';
import 'package:llsps_new/screens/busi_detail_screen.dart';

class BusinessScreen extends StatelessWidget {
  final List<Business> businesses = [
    Business(
      memberID: 'M001',
      name: 'Star Electronics',
      category: 'Electronics',
      description: 'Best electronics shop in town',
      contact: '+91 9876543210',
      imageUrls: [
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
      ],
    ),
    Business(
      memberID: 'M002',
      name: 'Fresh Bakes',
      category: 'Bakery',
      description: 'Delicious cakes and pastries',
      contact: '+91 9123456789',
      imageUrls: [
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
        'assets/images/sl.jpg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Business")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: businesses.length,
        itemBuilder: (context, index) {
          final business = businesses[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BusinessDetailScreen(business: business),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      business.imageUrls[0],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.25),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 12,
                      child: Text(
                        business.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}