import 'package:flutter/material.dart';
import 'package:casacraft/screens/properti_baru_detail.dart' as propertiBaru;
import 'package:casacraft/screens/whatsapp_page.dart'; // Import WhatsAppPage

class FavoriteDetailPage extends StatefulWidget {
  final Map<String, String> property;

  const FavoriteDetailPage({Key? key, required this.property}) : super(key: key);

  @override
  _FavoriteDetailPageState createState() => _FavoriteDetailPageState();
}

class _FavoriteDetailPageState extends State<FavoriteDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = propertiBaru.favoriteProperties.any(
      (property) => property['name'] == widget.property['name'],
    );
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        propertiBaru.favoriteProperties.removeWhere(
          (property) => property['name'] == widget.property['name'],
        );
      } else {
        propertiBaru.favoriteProperties.add(widget.property);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rumah Pilihan Anda'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.property['image'] ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.property['name'] ?? 'Nama tidak tersedia',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: toggleFavorite,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow('Luas Tanah', widget.property['size']),
                    _buildDetailRow('Luas Bangunan', widget.property['buildingSize']),
                    _buildDetailRow('Tipe Rumah', widget.property['type']),
                    _buildDetailRow('Lokasi', widget.property['location']),
                    _buildDetailRow('Deskripsi', widget.property['description']),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WhatsAppPage(
                        sellerName: 'Rumah Pilihan Anda',
                        sellerPhoneNumber: '6285179588921', // Nomor WhatsApp pribadi
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Hubungi Penjual',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value ?? 'Tidak tersedia',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
