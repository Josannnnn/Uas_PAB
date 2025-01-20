import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Pastikan path ke logo sesuai dengan folder assets Anda
          width: 500,
          height: 500,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
