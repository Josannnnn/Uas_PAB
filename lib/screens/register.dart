import 'package:flutter/material.dart';
import 'package:casacraft/screens/auth_users.dart';

class RegisterHomePage extends StatelessWidget {
  const RegisterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    void registerUser() {
      final username = usernameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("All fields must be filled.")),
        );
        return;
      }

      if (!email.endsWith("@gmail.com")) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email must end with @gmail.com")),
        );
        return;
      }

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match.")),
        );
        return;
      }

      if (AuthUsers.isEmailRegistered(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email is already registered.")),
        );
        return;
      }

      // Tambahkan pengguna baru ke AuthUsers
      AuthUsers.addUser(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );

      // Arahkan pengguna ke login.dart
      Navigator.pushNamed(context, '/login');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              'Hello! Register to get started',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
              ),
              child: const Text('Register', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Or Register with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/google');
                },
                child: Image.asset(
                  'assets/logo google.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Login Now',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
