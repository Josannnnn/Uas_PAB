import 'package:casacraft/screens/properti_baru.dart' as propertiBaruPage;
import 'package:casacraft/screens/properti_baru_detail.dart';
import 'package:casacraft/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'lokasi.dart'; // Mengarahkan ke lokasi.dart
import 'lokasi_jakarta.dart';
import 'lokasi_bandung.dart';
import 'lokasi_palembang.dart';
import 'lokasi_bogor.dart';
import 'favorite.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  void _onTabTapped(int index) {
    Widget page;
    if (index == 0) {
      page = const HomePage();
    } else if (index == 1) {
      page = const FavoritePage();
    } else {
      page = const ProfilePage();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false, // Menghapus semua history sebelumnya
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 70, width: 70),
            const SizedBox(width: 8),
            const Text(
              'CasaCraft',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
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
                  hintText: 'Mau cari properti dimana?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                onSubmitted: (query) {
                  if (query.toLowerCase() == 'jakarta') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LokasiJakartaPage()),
                    );
                  } else if (query.toLowerCase() == 'bandung') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LokasiBandungPage()),
                    );
                  } else if (query.toLowerCase() == 'palembang') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LokasiPalembangPage()),
                    );
                  } else if (query.toLowerCase() == 'bogor') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LokasiBogorPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Lokasi tidak ditemukan')),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Jual Beli Rumah dengan Lokasi Terbaik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Terdapat 450+ properti idaman dari berbagai lokasi di Jabodetabek dan Bandung.'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LokasiJakartaPage()),
                        );
                      },
                      child: _buildLocationCard(
                        context,
                        image: 'assets/rumah 1.jpg',
                        title: 'Jakarta',
                        subtitle: 'Rata-rata Rp 53 jt/m2',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LokasiBandungPage()),
                        );
                      },
                      child: _buildLocationCard(
                        context,
                        image: 'assets/rumah 2.jpg',
                        title: 'Bandung',
                        subtitle: 'Rata-rata Rp 20 jt/m2',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LokasiPage()),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Center(child: Text('Lihat Lokasi Properti Lain')),
              ),
              const SizedBox(height: 16),
              const Text(
                'Properti Baru di Jakarta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PropertiBaruDetailPage(
                              property: {
                                'image': 'assets/rumah 3.jpg',
                                'name': 'Liberty Residence Jagakarsa',
                                'size': '100m²',
                                'buildingSize': '80m²',
                                'type': '00',
                                'location':
                                    'Jl. Pinding No.17-36, RT.4/RW.1, Cipedak, Kec. Jagakarsa, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12630',
                                'description': 'Rumah 2 kamar tidur, 3 kamar mandi, dan 1 dapur.',
                                'price': '2.000.000.000',
                                'installment': 'Rp20.000.000/bulan',
                              },
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          _buildPropertyCard(
                            context,
                            image: 'assets/rumah 3.jpg',
                            title: 'Liberty Residence Jagakarsa',
                            price: 'Rp2.000.000.000',
                            size: 'LT 94-115m LB 135-240m',
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: const Text(
                                'NEW!',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PropertiBaruDetailPage(
                              property: {
                                'image': 'assets/rumah 4.jpg',
                                'name': '67 Kebagusan',
                                'size': '90m²',
                                'buildingSize': '70m²',
                                'type': '01',
                                'location':
                                    'Jl. Kebagusan Raya No.10, RT.3/RW.5, Kebagusan, Kec. Pasar Minggu, Kota Jakarta Selatan',
                                'description': 'Rumah 3 kamar tidur, 2 kamar mandi, dan taman luas.',
                                'price': '1.000.000.000',
                                'installment': 'Rp10.000.000/bulan',
                              },
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          _buildPropertyCard(
                            context,
                            image: 'assets/rumah 4.jpg',
                            title: '67 Kebagusan',
                            price: 'Rp1.000.000.000',
                            size: 'LT 55-60m LB 86-71m',
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: const Text(
                                'NEW!',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const propertiBaruPage.PropertiBaruPage()),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Center(child: Text('Lihat Properti Baru Lain')),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTabTapped(index);
        },
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, {required String image, required String title, required String subtitle}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 100, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, {required String image, required String title, required String price, required String size}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 100, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(color: Colors.green)),
                Text(size, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
