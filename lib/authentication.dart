import 'package:firebase_auth/firebase_auth.dart';

// Class ini digunakan sebagai controller untuk fungsi-fingsi firebase
// Fungsi-fungsi firebase tersebut sudah terdapat di dalam package auth firebase
// Sehingga hanya tinggal menggunakan fungsi-fungsi dari tersebut
class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

// Digunakan untuk Method Register (Sign Up) yang menerima input Email dan Password
  Future<String?> signUp({required String email, required String password}) async {
    // Akan dijalankan kondisi jika email dan password dimasukan maka akan menjalankan fungsi create user dari package firebase auth
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Jika tidak ada input maka akan direturn nilai null input
      return null;
    } on FirebaseAuthException catch (e) {
      // Fungsi ini digunakan untuk menangkap error handling ketika auth gagal dan menampilkan hasil errornya
      // Semisal jika sudah email sudah terdaftar di firebase
      return e.message;
    }
  }


// Digunakan untuk Method Login yang memerlukan input Email dan Password
  Future<String?> signIn({required String email, required String password}) async {
    // Akan dicoba jalankan kondisi ketika email dan password dimasukan maka akan menjalankan fungsi sign in dari package firebase auth
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      // Fungsi ini digunakan untuk menangkap error handling ketika auth gagal dan menampilkan hasil errornya
      // Semisal jika sudah email sudah terdaftar di firebase
      return e.message;
    }
  }

// Digunakan untuk Method Logout atau Sign out
  Future<void> signOut() async {
    // Digunakan fungsi signout dari package auth Firebase
    await _auth.signOut();
    print('signout');
  }
}