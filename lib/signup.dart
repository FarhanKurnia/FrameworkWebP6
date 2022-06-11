// Import pacakge material untuk tampilan seperti scafold
import 'package:flutter/material.dart';
//import class login untuk navigasi
import 'package:loginpage/login.dart';
// import class authentication karena sebagai controller yang berisi fungsi untuk ke firebase nya
import 'authentication.dart';
//import class login untuk navigasi login
import 'login.dart';

//Statefulwidget digunakan untuk menampilkan data-data yang bersifat dinamis (dapat mengalami perubahan)
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //Widget AppBar digunakan untuk digunakan sebagai bagian header yang dapat memuat judul ataupun navigasi dari aplikasi
        appBar: AppBar(
          //background color app bar
          backgroundColor: Colors.lightBlueAccent,
          //Tittle halaman register
          title: Text("Register"),
        ),
        // Widget body dengan scroll view
        body: SingleChildScrollView(
          //widget column mengatur tata letak atau posisi widget secara vertikal (dari atas ke bawah)
          child: Column(
            children: <Widget>[
            //digunakan untuk memberikan Padding
              Padding(
                //Padding atas dan bawah dari image
                padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
                //Widget: child center digunakan untuk membuat posisi widget berada di tengah
                child: Center(
                  //Widget: Child Container digunakan untuk membungkus atribut width, height dan widget image
                  child: Container(
                    width: 200,
                    height: 150,
                    //Widget:child untuk gambar logo pada tampilan login
                    child: Image.asset('asset/images/flutter-logo-bird.png')
                  ),
                ),
              ),
              //Digunakan untuk memberikan Padding dan child sign up form yang terpisah
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SignupForm(),
              ),
              // Row digunakan untuk membuat hyperlink yang mengarah ke login jika sudah memiliki akun
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 30),
                  // hanya sebagai text
                  Text('Already here? ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38,fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      // Navigasi untuk ke halaman login jika disentuh
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    // text hyperlink ke login
                    child: Text(
                      'Get Logged in Now!', style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
    );
  }
}

// class untuk signup form yang dipanggil pada child diatas
class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

// extend class signuoform
class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  // Pendefinisian variabel dari email password dan name
  String? email;
  String? password;
  String? name;
  bool _obscureText = false;

  // posisi agreement false artinya tidak tercentang saat awal ditampilkan (nilai default)
  bool agree = false;

  final pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );
    // definisi variabel sebagai ruang dengan tinggi 10 yang nantinya dapat digunakan hanya tinggal memanggil variabel
    var space = SizedBox(height: 10);
    // mengmbalikan form
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Field form untuk input email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
            // Widget untuk validasi email jika email terisi atau kosong
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
            keyboardType: TextInputType.emailAddress,
          ),

          // memanggil variable space yang mendefinisikan sizexbox diatas
          space,

          // Widget untuk validasi email jika email terisi atau kosong
          TextFormField(
            controller: pass,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onSaved: (val) {
              password = val;
            },
            obscureText: !_obscureText,
            // Widget untuk validasi jika password terisi atau kosong
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          // memanggil space perisi sizedbox untuk memberikan ruang
          space,
          // Widget untuk field konfirmasi password
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            // validasi apakah input yang dimasukan sama dengan password -> nilai variabel pass
            // jika tida sama maka akan menampilkan password tidak cocok
            validator: (value) {
              if (value != pass.text) {
                return 'password not match';
              }
              return null;
            },
          ),
          space,
          // Widget untuk field Nama
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              // akan disimpan dalam variabel name
              name = val;
            },
            // Validasi jika nilainya kosong
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),

          // Row untuk checkbox jika dilakukan perubahan maka akan benilai agree
          Row(
            children: <Widget>[
              Checkbox(
                onChanged: (_) {
                  setState(() {
                    agree = !agree;
                  });
                },
                value: agree,
              ),
              // text untuk penjelasan agreement
              Flexible(
                child: Text(
                    'By creating account, I agree to Terms & Conditions and Privacy Policy. This apps developed with <3 by Farhan Kurnia'),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          // Widget tombol untuk sign up
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //Jika diklik akan melakukan validasi dan jika lolos validasi maka akan disimpan
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // disini authentikasi helper (yang saya jadikan ibaratnya sebagai controller) dipanggil
                  AuthenticationHelper()
                      // akan menjalankan fungsi sign up yang ada di class auth
                      .signUp(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      // setelah itu akan diarahkan ke halaman login
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    } else {
                      //scafold untuk pesan snackbar
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              // styling dari tombol sign up termasuk test di dalam tombolnya
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}