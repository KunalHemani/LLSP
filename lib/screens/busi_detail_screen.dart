import 'package:flutter/material.dart';
import 'package:llsps_new/models/business_user_model.dart';


class BusinessDetailScreen extends StatelessWidget {
  final Business business;

  BusinessDetailScreen({required this.business});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(business.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${business.memberID}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Category: ${business.name}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Category: ${business.category}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Description: ${business.description}", style: TextStyle(fontSize: 14)),
              SizedBox(height: 8),
              Text("Contact: ${business.contact}", style: TextStyle(fontSize: 14)),
              SizedBox(height: 16),
              Text("Gallery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: business.imageUrls.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        business.imageUrls[index],
                        width: 150,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
