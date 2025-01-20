class AuthUsers {
  // Simulasi daftar pengguna
  static final List<Map<String, String>> users = [
    {
      'email': 'axelursia@gmail.com',
      'password': 'password123',
      'otp': '1234', // Tambahkan OTP untuk pengguna ini
    },
    {
      'email': 'agung@gmail.com',
      'password': 'password456',
      'otp': '5678', // Tambahkan OTP untuk pengguna ini
    },
    {
      'email': 'jonathan@gmail.com',
      'password': 'password789',
      'otp': '9012', // Tambahkan OTP untuk pengguna ini
    },
  ];

  // Fungsi untuk memeriksa validitas email dan password
  static bool authenticate(String email, String password) {
    // Periksa apakah email dan password cocok
    return users.any((user) => user['email'] == email && user['password'] == password);
  }

  // Fungsi untuk memeriksa apakah email terdaftar
  static bool isEmailRegistered(String email) {
    // Periksa apakah email terdaftar
    return users.any((user) => user['email'] == email);
  }

  // Fungsi untuk memeriksa OTP
  static bool validateOtp(String email, String otp) {
    // Periksa apakah OTP cocok dengan email
    return users.any((user) => user['email'] == email && user['otp'] == otp);
  }

  // Fungsi untuk menambahkan pengguna baru
  static void addUser({required String email, required String password}) {
    users.add({'email': email, 'password': password});
  }
}
