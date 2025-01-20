import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final VoidCallback onTap;

  const PropertyCard({Key? key, 
    required this.title,
    required this.location,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 220, // Tambahkan tinggi minimum untuk memperpanjang card box
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/property_placeholder.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                location,
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                price,
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
