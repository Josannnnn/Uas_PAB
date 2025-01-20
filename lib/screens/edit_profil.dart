import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String avatar;
  final Function({
    required String name,
    required String email,
    required String phone,
    required String avatar,
  }) onUpdate;

  const EditProfilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profil",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Lengkap",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan nama lengkap",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan email",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Nomor Telepon",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan nomor telepon",
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  widget.onUpdate(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneController.text.trim(),
                    avatar: widget.avatar, // Avatar tidak diubah
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Perubahan berhasil disimpan!")),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white, // Warna tulisan putih
                ),
                child: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
