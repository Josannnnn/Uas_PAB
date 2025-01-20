import 'package:flutter/material.dart';
import 'package:casacraft/screens/auth_users.dart'; // Import AuthUsers

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  void _validateAndSendCode() {
    final email = _emailController.text.trim();

    setState(() {
      _errorMessage = null; // Reset error message
    });

    if (email.isEmpty) {
      setState(() {
        _errorMessage = "Email cannot be empty.";
      });
      return;
    }

    if (!email.endsWith("@gmail.com")) {
      setState(() {
        _errorMessage = "Email must end with @gmail.com.";
      });
      return;
    }

    if (!AuthUsers.isEmailRegistered(email)) {
      setState(() {
        _errorMessage = "This email is not registered.";
      });
      return;
    }

    // Navigate to OTP Verification page with email as argument
    Navigator.pushNamed(
      context,
      '/otp_verification',
      arguments: email, // Kirimkan email
    );
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
              'Forgot Password?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateAndSendCode,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Send Code',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
