import 'package:casacraft/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman login
import 'home.dart'; // Import halaman home
import 'favorite.dart'; // Import halaman favorite

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FavoritePage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Silahkan Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16),
                ),
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
        currentIndex: 2, // Indeks halaman profil saat ini
        onTap: (index) => _onTabTapped(context, index),
      ),
    );
  }
}
