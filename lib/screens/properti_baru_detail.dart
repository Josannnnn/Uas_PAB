import 'package:flutter/material.dart';
import 'package:casacraft/screens/whatsapp_page.dart'; // Import WhatsAppPage

// Daftar global untuk menyimpan properti favorit
List<Map<String, String>> favoriteProperties = [];

class PropertiBaruDetailPage extends StatefulWidget {
  final Map<String, String> property; // Menggunakan Map untuk data properti

  const PropertiBaruDetailPage({Key? key, required this.property}) : super(key: key);

  @override
  _PropertiBaruDetailPageState createState() => _PropertiBaruDetailPageState();
}

class _PropertiBaruDetailPageState extends State<PropertiBaruDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Cek apakah properti sudah ada di daftar favorit
    isFavorite = favoriteProperties.any((property) => property['name'] == widget.property['name']);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        // Hapus dari daftar favorit
        favoriteProperties.removeWhere((property) => property['name'] == widget.property['name']);
      } else {
        // Tambahkan ke daftar favorit
        favoriteProperties.add(widget.property);
      }
      isFavorite = !isFavorite;
    });
  }

  void goToWhatsApp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WhatsAppPage(
          sellerName: widget.property['name'] ?? 'Penjual',
          sellerPhoneNumber: '6285179588921', // Masukkan nomor WhatsApp
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Rumah Pilihan Anda',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Properti
            Stack(
              children: [
                Image.asset(
                  widget.property['image'] ?? '',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      height: 250,
                      child: const Center(
                        child: Text(
                          'Unable to load image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                // Tulisan NEW! di ujung kiri atas
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
            const SizedBox(height: 16),

            // Informasi Properti
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

            // Harga Properti
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harga: Rp ${widget.property['price'] ?? 'Tidak tersedia'}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cicilan: ${widget.property['installment'] ?? 'Tidak tersedia'}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Hubungi Penjual
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: goToWhatsApp,
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
