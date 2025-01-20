import 'package:casacraft/screens/auth_users.dart';
import 'package:flutter/material.dart';
import 'home_login.dart'; // Import HomeLoginPage untuk navigasi setelah login
import 'google.dart'; // Import GoogleLoginPage untuk login melalui Google

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  void _validateAndLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _errorMessage = null; // Reset error message
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Email and password cannot be empty.";
      });
      return;
    }

    if (!email.endsWith("@gmail.com")) {
      setState(() {
        _errorMessage = "Email must end with @gmail.com.";
      });
      return;
    }

    if (!AuthUsers.authenticate(email, password)) {
      setState(() {
        _errorMessage = "Invalid email or password.";
      });
      return;
    }

    // Navigate to HomeLoginPage on successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeLoginPage()),
    );
  }

  void _loginWithGoogle() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleLoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();

    // Listen for changes in email and password controllers to reset error message
    _emailController.addListener(() {
      setState(() {
        _errorMessage = null;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _errorMessage = null;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Hello! Login to get started',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password'); // Navigasi ke ForgotPasswordPage
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateAndLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Or Login with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: _loginWithGoogle,
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
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Register Now',
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
