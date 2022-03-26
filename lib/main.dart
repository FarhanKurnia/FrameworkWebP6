import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Set Warna Backgrounnd putih
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Tittle halaman login
          backgroundColor: Colors.lightBlueAccent,
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //Padding atas dan bawah dari image
              padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    //Widget:child untuk gambar logo pada tampilan login
                    child: Image.asset('asset/images/flutter-logo-bird.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              //Widget: child untuk Textfield E-Mail
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid E-mail as Farhan@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              //Widget: child text untuk Textfield Password
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              //Widget: child text untuk Flatbutton hyperlink lupa password
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black12, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
              //Widget: child untuk Flatbutton Login
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                //Widget: child untuk text Login dalam button
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              //Widget: child untuk text flatbutton hyperlink Create Account
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