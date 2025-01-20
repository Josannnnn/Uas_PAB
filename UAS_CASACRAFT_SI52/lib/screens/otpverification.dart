import 'package:flutter/material.dart';
import 'changepassword.dart'; // Import halaman Change Password

class OTPVerificationPage extends StatefulWidget {
  final String email; // Email pengguna untuk memvalidasi OTP
  const OTPVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  String? _errorMessage;

  void _validateAndVerify() {
    final otp = _controllers.map((controller) => controller.text).join();

    setState(() {
      _errorMessage = null;
    });

    if (otp.length < 4) {
      setState(() {
        _errorMessage = "Please complete the OTP.";
      });
      return;
    }

    // Validasi OTP dummy (ganti dengan logika validasi OTP nyata jika diperlukan)
    if (otp != "1234") {
      setState(() {
        _errorMessage = "Invalid OTP. Please try again.";
      });
      return;
    }

    // Jika OTP valid, navigasi ke halaman ChangePasswordPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
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
            Text(
              'OTP Verification for ${widget.email}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the verification code we just sent on your email address.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  height: 60,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 3) {
                          _focusNodes[index + 1].requestFocus(); // Pindah ke kolom berikutnya
                        } else {
                          _focusNodes[index].unfocus(); // Selesai
                        }
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus(); // Kembali ke kolom sebelumnya
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateAndVerify,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
              ),
              child: const Text('Verify', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
