import 'package:flutter/material.dart';
import 'lokasi.dart'; // Mengimpor data bogorProperties dari lokasi.dart
import 'lokasi_detail.dart'; // Mengimpor halaman LokasiDetailPage

class LokasiBogorPage extends StatefulWidget {
  const LokasiBogorPage({Key? key}) : super(key: key);

  @override
  _LokasiBogorPageState createState() => _LokasiBogorPageState();
}

class _LokasiBogorPageState extends State<LokasiBogorPage> {
  List<Map<String, String>> displayedProperties = bogorProperties; // Properti Bogor

  void _searchProperty(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedProperties = bogorProperties;
      } else {
        displayedProperties = bogorProperties
            .where((property) =>
                property['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Beranda > Bogor',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Properti di Bogor',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: _searchProperty,
              ),
              const SizedBox(height: 16),
              const Text(
                'Properti di Bogor',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: displayedProperties.length,
                itemBuilder: (context, index) {
                  final property = displayedProperties[index];
                  return _buildPropertyCard(context, property);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, Map<String, String> property) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            property['image']!,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  property['location']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  'Rp ${property['price']}',
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  property['installment']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Mengarahkan ke halaman LokasiDetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LokasiDetailPage(property: property),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                  ),
                  child: const Text('Detail', style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
