import 'package:casacraft/screens/changepassword.dart';
import 'package:casacraft/screens/home_login.dart';
import 'package:casacraft/screens/properti_baru.dart';
import 'package:casacraft/screens/properti_baru_detail.dart';
import 'package:flutter/material.dart';
import 'screens/favorite.dart';
import 'screens/favorite_detail.dart';
import 'screens/home.dart';
import 'screens/logo.dart'; // Import LogoPage
import 'screens/google.dart'; // Import GooglePage
import 'screens/login.dart'; // Import LoginPage
import 'screens/register.dart'; // Import RegisterPage
import 'screens/welcome.dart'; // Import WelcomePage
import 'screens/forgotpassword.dart'; // Import ForgotPasswordPage
import 'screens/otpverification.dart'; // Import OTPVerificationPage
import 'screens/passwordchange.dart'; // Import PasswordChangePage
import 'screens/lokasi_detail.dart'; // Import LokasiDetailPage
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CasaCraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Set SplashScreen sebagai halaman awal
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/hom_login': (context) => const HomeLoginPage(),
        '/favorite': (context) => const FavoritePage(),
        '/favorite_detail': (context) => FavoriteDetailPage(
              property: ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>, // Argument property
            ),
        '/google': (context) => const GoogleLoginPage(),
        '/login': (context) => const LoginHomePage(),
        '/register': (context) => const RegisterHomePage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/otp_verification': (context) => OTPVerificationPage(
              email: ModalRoute.of(context)!.settings.arguments as String,
            ),
        '/password_change': (context) => const PasswordChangePage(),
        '/change_password': (context) => const ChangePasswordPage(),
        '/lokasi_detail': (context) => const LokasiDetailPage(property: {}), // Placeholder untuk LokasiDetailPage
        '/properti_baru_detail': (context) => const PropertiBaruDetailPage(property: {}),
        '/properti_baru': (context) => const PropertiBaruPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home'); // Navigasi otomatis ke HomePage
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LogoPage(); // Menampilkan halaman logo
  }
}
