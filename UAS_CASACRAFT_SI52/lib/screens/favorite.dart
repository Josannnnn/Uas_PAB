import 'package:flutter/material.dart';
import 'package:casacraft/screens/properti_baru_detail.dart' as propertiBaru; // Alias untuk properti_baru_detail
import 'package:casacraft/screens/favorite_detail.dart'; // Untuk navigasi ke FavoriteDetailPage
import 'home.dart'; // Untuk navigasi ke HomePage
import 'profile.dart'; // Untuk navigasi ke ProfilePage

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String searchQuery = ''; // Query pencarian

  @override
  Widget build(BuildContext context) {
    // Filter properti dari daftar global propertiBaru.favoriteProperties berdasarkan query pencarian
    final filteredFavorites = propertiBaru.favoriteProperties
        .where((property) =>
            property['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari Nama Cluster',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          onChanged: (query) {
            setState(() {
              searchQuery = query; // Memperbarui query pencarian
            });
          },
        ),
      ),
      body: filteredFavorites.isEmpty
          ? const Center(
              child: Text('Belum ada properti favorit.'),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Berikut rumah yang Anda sukai',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('${filteredFavorites.length} properti ditemukan:'),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: filteredFavorites.length,
                      itemBuilder: (context, index) {
                        final property = filteredFavorites[index];
                        return _buildPropertyCard(
                          context,
                          property: property,
                          onRemove: () {
                            setState(() {
                              propertiBaru.favoriteProperties.removeWhere(
                                  (item) => item['name'] == property['name']);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Index untuk halaman Favorite
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(
    BuildContext context, {
    required Map<String, String> property,
    required VoidCallback onRemove,
  }) {
    return Card(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke FavoriteDetailPage dengan mengirim data property
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteDetailPage(property: property),
                ),
              );
            },
            child: Image.asset(
              property['image'] ?? '',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property['name'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  property['location'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  property['price'] ?? '',
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                Text(
                  property['installment'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onRemove,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteDetailPage(property: property),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Detail',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
