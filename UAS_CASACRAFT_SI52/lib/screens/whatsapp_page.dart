import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppPage extends StatelessWidget {
  final String sellerName;
  final String sellerPhoneNumber; // Pastikan parameter ini ada

  const WhatsAppPage({
    Key? key,
    required this.sellerName,
    required this.sellerPhoneNumber, // Pastikan parameter ini juga ada di konstruktor
  }) : super(key: key);

  void _openWhatsApp(String phoneNumber) async {
    final String whatsappUrl =
        "https://wa.me/$phoneNumber?text=Halo%20$sellerName,%20saya%20tertarik%20dengan%20properti%20Anda.";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not open WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hubungi Kami di Whatsapp Sekarang!',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo whatsapp.png', // Gambar ikon WhatsApp
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 16),
            const Text(
              'Konsultasikan Rumah Anda dengan Kami!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Wujudkan Impianmu bersama kami......',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _openWhatsApp(sellerPhoneNumber),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Whatsapp Sekarang!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
