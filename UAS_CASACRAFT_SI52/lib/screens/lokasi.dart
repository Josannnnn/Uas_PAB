import 'package:flutter/material.dart';
import 'lokasi_detail.dart';

// Properti Jakarta
final List<Map<String, String>> properties = [
  {
    'image': 'assets/rumah 1 lokasi.jpg',
    'name': 'Griya Mulia',
    'location': 'Cempaka Putih, Jakarta Pusat',
    'price': '500.000.000',
    'installment': 'Cicilan 2jt/bulan',
  },
  {
    'image': 'assets/rumah 2 lokasi.jpg',
    'name': 'Gambir Park',
    'location': 'Gambir, Jakarta Pusat',
    'price': '600.000.000',
    'installment': 'Cicilan 5jt/bulan',
  },
  {
    'image': 'assets/rumah 3 lokasi.jpg',
    'name': 'Aquatic',
    'location': 'kemayoran, Jakarta Pusat',
    'price': '1963000000',
    'installment': 'Cicilan 2jt/bulan',
  },
  {
    'image': 'assets/rumah 4 lokasi.jpg',
    'name': 'Boomside',
    'location': 'Tebet, Jakarta Selatan',
    'price': '3.423.000.000',
    'installment': 'Cicilan 5jt/bulan',
  },
  {
    'image': 'assets/rumah 5 lokasi.jpg',
    'name': 'Lion Park',
    'location': 'Ancol, Jakarta Utara',
    'price': '500.000.000',
    'installment': 'Cicilan 2jt/bulan',
  },
  {
    'image': 'assets/rumah 6 lokasi.jpg',
    'name': 'Green Garden',
    'location': 'Tanah Abang, Jakarta Pusat',
    'price': '4.120.000.000',
    'installment': 'Cicilan 5jt/bulan',
  },
  {
    'image': 'assets/rumah 7 lokasi.jpg',
    'name': 'Blue Ocean',
    'location': 'Rawamangun, Jakarta Timur',
    'price': '500.000.000',
    'installment': 'Cicilan 2jt/bulan',
  },
  {
    'image': 'assets/rumah 8 lokasi.jpg',
    'name': 'Scandinavian',
    'location': 'Mangga Dua, Jakarta Utara',
    'price': '3.500.000.000',
    'installment': 'Cicilan 5jt/bulan',
  },
];

// Properti Bandung
final List<Map<String, String>> bandungProperties = [
  {
    'image': 'assets/rumah 1 bandung.jpg',
    'name': 'Bandung Paradise',
    'location': 'Cihapit, Kota Bandung',
    'price': '752.300.000',
    'installment': 'Cicilan 4jt/bulan',
  },
  {
    'image': 'assets/rumah 2 bandung.jpg',
    'name': 'Sunda Hills',
    'location': 'Tubagus Ismail, Kota Bandung',
    'price': '2.577.000.000',
    'installment': 'Cicilan 6jt/bulan',
  },
  {
    'image': 'assets/rumah 3 bandung.jpg',
    'name': 'Cihapit Park',
    'location': 'Cihapit, Kota Bandung',
    'price': '2.050.000.000',
    'installment': 'Cicilan 4jt/bulan',
  },
  {
    'image': 'assets/rumah 4 bandung.jpg',
    'name': 'Saparua Village',
    'location': 'Tubagus Ismail, Kota Bandung',
    'price': '89.500.000.000',
    'installment': 'Cicilan 6jt/bulan',
  },
];

// Properti Bogor
final List<Map<String, String>> bogorProperties = [
  {
    'image': 'assets/rumah 1 bogor.jpg',
    'name': 'Royal Tulip',
    'location': 'Nagrak, Kota Bogor',
    'price': '5.500.000.000',
    'installment': 'Cicilan 4jt/bulan',
  },
  {
    'image': 'assets/rumah 2 bogor.jpg',
    'name': 'Bigland Sentul',
    'location': 'Sentul, Kota Bogor',
    'price': '100.000.000',
    'installment': 'Cicilan 6jt/bulan',
  },
];

// Properti Palembang
final List<Map<String, String>> palembangProperties = [
  {
    'image': 'assets/rumah 1 palembang.jpg',
    'name': 'Villa Tanjung Harapan',
    'location': 'Kenten, Kota Palembang',
    'price': '8.760.000.000',
    'installment': 'Cicilan 4jt/bulan',
  },
  {
    'image': 'assets/rumah 2 palembang.jpg',
    'name': 'Oki Residence',
    'location': 'Oki, Kota Palembang',
    'price': '10.000.000.000',
    'installment': 'Cicilan 6jt/bulan',
  },
];

// Gabungan semua properti
final List<Map<String, String>> allProperties = [
  ...properties,
  ...bandungProperties,
  ...bogorProperties,
  ...palembangProperties,
];

class LokasiPage extends StatefulWidget {
  const LokasiPage({Key? key}) : super(key: key);

  @override
  _LokasiPageState createState() => _LokasiPageState();
}

class _LokasiPageState extends State<LokasiPage> {
  List<Map<String, String>> displayedProperties = allProperties;

  void _searchProperty(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedProperties = allProperties;
      } else {
        displayedProperties = allProperties
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
          'Beranda > Lokasi',
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
                        builder: (context) => LokasiDetailPage(property: property),
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
    );
  }
}
