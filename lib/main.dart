import 'package:flutter/material.dart';
import 'login.dart';
import 'package:loginpage/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

// class untuk mengatasi handshake problem (CERTIFICATE_VERIFY_FAILED)
// htttp client request untuk mengizinkan semua request http
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Untuk inisialiasi firebase
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());

}

//Statelesswidget digunakan untuk menampilkan data-data yang bersifat statis (tidak mengalami perubahan)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: Login(),
    );
  }
}
