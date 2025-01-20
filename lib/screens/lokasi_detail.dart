import 'package:casacraft/screens/properti_baru_detail.dart' as propertiBaru; // Gunakan alias propertiBaru
import 'package:flutter/material.dart';
import 'package:casacraft/screens/whatsapp_page.dart' as whatsappPage; // Gunakan alias whatsappPage

class LokasiDetailPage extends StatefulWidget {
  final Map<String, String> property;

  const LokasiDetailPage({Key? key, required this.property}) : super(key: key);

  @override
  _LokasiDetailPageState createState() => _LokasiDetailPageState();
}

class _LokasiDetailPageState extends State<LokasiDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Cek apakah properti ini sudah ada di daftar favorit
    isFavorite = propertiBaru.favoriteProperties.any(
        (property) => property['name'] == widget.property['name']);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        // Hapus dari daftar favorit
        propertiBaru.favoriteProperties.removeWhere(
            (property) => property['name'] == widget.property['name']);
      } else {
        // Tambahkan ke daftar favorit
        propertiBaru.favoriteProperties.add(widget.property);
      }
      isFavorite = !isFavorite; // Perbarui status favorit
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Rumah Pilihan Anda',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
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
            Image.asset(
              widget.property['image']!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
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
                    // Nama Properti dan Tombol Favorit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.property['name']!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: toggleFavorite,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Detail Properti
                    _buildDetailRow(
                        'Luas Tanah', widget.property['size'] ?? '100m²'),
                    _buildDetailRow('Luas Bangunan',
                        widget.property['buildingSize'] ?? '80m²'),
                    _buildDetailRow('Tipe Rumah',
                        widget.property['type'] ?? '00'),
                    _buildDetailRow('Lokasi',
                        widget.property['address'] ?? 'Jl. Prajurit KKO Usman dan Harun No.44-48, RT.7/RW.1, Gambir, Kecamatan Gambir, Kota Jakarta Pusat'),
                    _buildDetailRow('Deskripsi',
                        widget.property['description'] ?? 'Rumah 3 kamar tidur, 3 kamar mandi, dan 1 dapur.'),
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
                    'Harga: Rp ${widget.property['price']}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cicilan: ${widget.property['installment']}',
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Hubungi Penjual
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke whatsappPage.WhatsAppPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => whatsappPage.WhatsAppPage(
                        sellerName: widget.property['name']!,
                        sellerPhoneNumber: '6285179588921', // Nomor WhatsApp
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

  // Fungsi Helper untuk Menampilkan Detail Properti
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
