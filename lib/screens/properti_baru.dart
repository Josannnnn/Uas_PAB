import 'package:casacraft/screens/properti_baru_detail.dart';
import 'package:flutter/material.dart';

final List<Map<String, String>> properties = [
  {
    'image': 'assets/rumah 1 properti baru.jpg',
    'name': 'Orchard Park',
    'location': 'Bogor, Jawa Barat',
    'price': '500.000.000',
    'installment': 'Cicilan 2jt/bulan',
    'size': '120m²',
    'buildingSize': '90m²',
    'type': 'Cluster',
    'description': 'Rumah modern dengan fasilitas lengkap.',
  },
  {
    'image': 'assets/rumah 2 properti baru.jpg',
    'name': 'Pavilion Park',
    'location': 'Bandung, Jawa Barat',
    'price': '600.000.000',
    'installment': 'Cicilan 5jt/bulan',
    'size': '140m²',
    'buildingSize': '110m²',
    'type': 'Cluster',
    'description': 'Rumah minimalis di lokasi strategis.',
  },
  {
    'image': 'assets/rumah 3 properti baru.jpg',
    'name': 'Atlantis',
    'location': 'Cirebon, Jawa Barat',
    'price': '5.000.000.000',
    'installment': 'Cicilan 2jt/bulan',
    'size': '100m²',
    'buildingSize': '80m²',
    'type': 'Cluster',
    'description': 'Hunian asri dengan lingkungan hijau.',
  },
  {
    'image': 'assets/rumah 4 properti baru.jpg',
    'name': 'Woodside',
    'location': 'Banjar, Jawa Barat',
    'price': '680.000.000',
    'installment': 'Cicilan 5jt/bulan',
    'size': '160m²',
    'buildingSize': '130m²',
    'type': 'Cluster',
    'description': 'Rumah nyaman dengan desain modern.',
  },
];

class PropertiBaruPage extends StatefulWidget {
  const PropertiBaruPage({Key? key}) : super(key: key);

  @override
  _PropertiBaruPageState createState() => _PropertiBaruPageState();
}

class _PropertiBaruPageState extends State<PropertiBaruPage> {
  List<Map<String, String>> displayedProperties = properties;

  void _searchProperty(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedProperties = properties;
      } else {
        displayedProperties = properties
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
          'Beranda > Properti Baru',
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
                  hintText: 'Cari nama rumah',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: _searchProperty,
              ),
              const SizedBox(height: 16),
              const Text(
                'Semua Properti',
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
      child: Stack(
        children: [
          Column(
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
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      property['installment']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertiBaruDetailPage(property: property),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 30),
                      ),
                      child: const Text('Detail'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: const Text(
                'NEW!',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
