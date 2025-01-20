import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Page',
      initialRoute: '/', // Set route awal ke WelcomePage
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset('assets/logo.png', height: 350),
            const SizedBox(height: 10),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Register Button
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Register Page
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
