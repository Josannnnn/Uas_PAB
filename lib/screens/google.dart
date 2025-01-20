import 'package:flutter/material.dart';
import 'home_login.dart'; // Import HomeLoginPage
import 'package:casacraft/screens/auth_users.dart';

class GoogleLoginPage extends StatelessWidget {
  const GoogleLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Google Login',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your Google account to login:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: AuthUsers.users.length,
                itemBuilder: (context, index) {
                  final user = AuthUsers.users[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person), // Simulated profile icon
                      ),
                      title: Text(user['email']!),
                      onTap: () {
                        // Navigate to HomeLoginPage when an account is selected
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeLoginPage(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
