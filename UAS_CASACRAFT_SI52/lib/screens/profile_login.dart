import 'package:flutter/material.dart';
import 'edit_profil.dart'; // Import halaman Edit Profil
import 'favorite_login.dart'; // Import halaman Favorite Login
import 'home_login.dart'; // Import halaman Home Login
import 'home.dart'; // Import halaman Home

class ProfileLoginPage extends StatefulWidget {
  const ProfileLoginPage({Key? key}) : super(key: key);

  @override
  State<ProfileLoginPage> createState() => _ProfileLoginPageState();
}

class _ProfileLoginPageState extends State<ProfileLoginPage> {
  String userName = "Ratu";
  String userEmail = "ratuemalda@gmail.com";
  String userPhone = "+62 821 712 777";
  String userAvatar = 'assets/foto profil.png';
  bool isNotificationOn = true; // Status notifikasi
  String selectedLanguage = "id"; // Default bahasa: Indonesia

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String avatar,
  }) {
    setState(() {
      userName = name;
      userEmail = email;
      userPhone = phone;
      userAvatar = avatar;
    });
  }

  void toggleNotification() {
    setState(() {
      isNotificationOn = !isNotificationOn;
    });
    final message = isNotificationOn ? "Notifikasi dinyalakan" : "Notifikasi dimatikan";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  String translate(String idText, String enText) {
    return selectedLanguage == "id" ? idText : enText;
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(translate("Pilih Bahasa", "Choose Language")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Indonesia"),
              onTap: () {
                setState(() {
                  selectedLanguage = "id";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("English"),
              onTap: () {
                setState(() {
                  selectedLanguage = "en";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showContactUs() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(translate("Hubungi Kami", "Contact Us")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: const Text("support@casacraft.com"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("+62 123 456 789"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(translate("Kebijakan Privasi", "Privacy Policy")),
        content: SingleChildScrollView(
          child: Text(
            translate(
              "Kami menghormati privasi Anda dan berkomitmen untuk melindungi data pribadi Anda.",
              "We respect your privacy and are committed to protecting your personal data.",
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(translate("Tutup", "Close")),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate("Profil", "Profile")),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // Menghapus tombol back
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(userAvatar),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      name: userName,
                      email: userEmail,
                      phone: userPhone,
                      avatar: userAvatar,
                      onUpdate: updateProfile,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.blue),
              label: Text(
                translate("Edit Profil", "Edit Profile"),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$userEmail | $userPhone',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.black),
              title: Text(translate("Informasi Pribadi", "Personal Information")),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      name: userName,
                      email: userEmail,
                      phone: userPhone,
                      avatar: userAvatar,
                      onUpdate: updateProfile,
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black),
              title: Text(translate("Notifikasi", "Notifications")),
              trailing: Text(
                isNotificationOn ? translate("Nyala", "On") : translate("Mati", "Off"),
                style: TextStyle(
                  color: isNotificationOn ? Colors.blue : Colors.grey,
                  fontSize: 16,
                ),
              ),
              onTap: toggleNotification,
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title: Text(translate("Bahasa", "Language")),
              trailing: Text(
                selectedLanguage == "id" ? "Indonesia" : "English",
                style: const TextStyle(color: Colors.blue, fontSize: 16),
              ),
              onTap: _showLanguageDialog,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.contact_support, color: Colors.black),
              title: Text(translate("Hubungi Kami", "Contact Us")),
              onTap: _showContactUs,
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.black),
              title: Text(translate("Kebijakan Privasi", "Privacy Policy")),
              onTap: _showPrivacyPolicy,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(translate("Logout", "Logout")),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeLoginPage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FavoriteLoginPage()),
            );
          }
        },
      ),
    );
  }
}
