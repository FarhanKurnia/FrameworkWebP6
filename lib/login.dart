import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signup.dart';
import 'authentication.dart';

//Statefulwidget digunakan untuk menampilkan data-data yang bersifat dinamis (dapat mengalami perubahan)
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //Widget Scaffold digunakan sebagai widget utama untuk membuat sebuah halaman
    return Scaffold(
      //backgorunfColor digunakan untuk membuat Warna Backgrounnd putih
      backgroundColor: Colors.white,
      //Widget AppBar digunakan untuk digunakan sebagai bagian header yang dapat memuat judul ataupun navigasi dari aplikasi
      appBar: AppBar(
        //background color app bar
        backgroundColor: Colors.lightBlueAccent,
        //Tittle halaman login
        title: Text("Login Page"),
      ),
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
                    child: Image.asset('asset/images/flutter-logo-bird.png')),
              ),
            ),
            //digunakan untuk memberikan Padding
            // SizedBox(
            //   height: 50,
            // ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),

            // SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('New User?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38,fontSize: 15)),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/signup');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  //Widget: child untuk text flatbutton hyperlink register atau Create Account
                  child: Text(
                    'Create Account', style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),

            // Padding(
            //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   //Widget: child Textfield Email agar user dapat melakukan input email
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Email',
            //         hintText: 'Enter valid E-mail as Farhan@gmail.com'),
            //   ),
            // ),
            // //digunakan untuk memberikan Padding
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 15.0, right: 15.0, top: 15, bottom: 0),
            //   //padding: EdgeInsets.symmetric(horizontal: 15),
            //   //Widget: child Textfield Password agar user dapat melakukan input password
            //   child: TextField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Password',
            //         hintText: 'Enter secure password'),
            //   ),
            // ),
            // //Widget flat button digunakan untuk membuat tombol forgot password tanpa efek-efek seperti bayangan dan lain-lain.
            // FlatButton(
            //   // OnPressed disini kosong, dapat diisi dengan mengarahkan ke halaman forgit password.
            //   onPressed: (){
            //     //bagian koding jika tombol ditekan
            //   },
            //   //Widget: child text untuk Flatbutton hyperlink lupa password
            //   child: Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.black12, fontSize: 15),
            //   ),
            // ),
            // //Widget: Container digunakan untuk membungkus atribut width, height, decoration, color, flatbutton dan text login
            // Container(
            //   height: 50,
            //   width: 150,
            //   decoration: BoxDecoration(
            //       color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
            //   //Widget flat button digunakan untuk membuat tombol tanpa efek-efek seperti bayangan dan lain-lain.
            //   child: FlatButton(
            //     // Onpressed disini ketika tombol diklik maka akan diarahkan ke halaman home page
            //     onPressed: () {
            //       //Navigator push digunakan untuk membuka halaman baru
            //       Navigator.push(
            //           context, MaterialPageRoute(builder: (_) => HomePage()));
            //     },
            //     //Widget: child untuk text Login dalam flatbutton
            //     child: Text(
            //       'Login',
            //       style: TextStyle(color: Colors.white, fontSize: 20),
            //     ),
            //   ),
            // ),
            // //Widget untuk mengatur jarak dengan atribut tinggi 40
            // SizedBox(
            //   height: 40,
            // ),
            // // //Widget flat button digunakan untuk membuat tombol tanpa efek-efek seperti bayangan dan lain-lain.
            // FlatButton(
            //   // OnPressed disini kosong, dapat diisi dengan mengarahkan ke halaman register.
            //   onPressed: (){
            //     //bagian koding jika tombol ditekan
            //   },
            //   //Widget: child untuk text flatbutton hyperlink register atau Create Account
            //   child: Text(
            //     'New User? Create Account',
            //     style: TextStyle(color: Colors.black12, fontSize: 15),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
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
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
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
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}