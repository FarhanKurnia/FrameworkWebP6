import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}
//Statelesswidget digunakan untuk menampilkan data-data yang bersifat statis (tidak mengalami perubahan)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}
//Statefulwidget digunakan untuk menampilkan data-data yang bersifat dinamis (dapat mengalami perubahan)
class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
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
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              //Widget: child Textfield Email agar user dapat melakukan input email
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid E-mail as Farhan@gmail.com'),
              ),
            ),
            //digunakan untuk memberikan Padding
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              //Widget: child Textfield Password agar user dapat melakukan input password
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            //Widget flat button digunakan untuk membuat tombol forgot password tanpa efek-efek seperti bayangan dan lain-lain.
            FlatButton(
              // OnPressed disini kosong, dapat diisi dengan mengarahkan ke halaman forgit password. 
              onPressed: (){
                //bagian koding jika tombol ditekan
              },
              //Widget: child text untuk Flatbutton hyperlink lupa password
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black12, fontSize: 15),
              ),
            ),
            //Widget: Container digunakan untuk membungkus atribut width, height, decoration, color, flatbutton dan text login
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
              //Widget flat button digunakan untuk membuat tombol tanpa efek-efek seperti bayangan dan lain-lain.
              child: FlatButton(
                // Onpressed disini ketika tombol diklik maka akan diarahkan ke halaman home page
                onPressed: () {
                  //Navigator push digunakan untuk membuka halaman baru
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                //Widget: child untuk text Login dalam flatbutton
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            //Widget untuk mengatur jarak dengan atribut tinggi 40
            SizedBox(
              height: 40,
            ),
            // //Widget flat button digunakan untuk membuat tombol tanpa efek-efek seperti bayangan dan lain-lain.
            FlatButton(
              // OnPressed disini kosong, dapat diisi dengan mengarahkan ke halaman register. 
              onPressed: (){
                //bagian koding jika tombol ditekan
              },
              //Widget: child untuk text flatbutton hyperlink register atau Create Account
              child: Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.black12, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}