import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Widget Scaffold digunakan sebagai widget utama untuk membuat sebuah halaman 
    return Scaffold(
      //Widget AppBar digunakan untuk digunakan sebagai bagian header yang dapat memuat judul ataupun navigasi dari aplikasi
      appBar: AppBar(
        //background color app bar
        backgroundColor: Colors.lightBlueAccent,
        //Tittle halaman login
        title: Text('Home Page'),
      ),
      //membuat body menjadi berada di tengah
      body: Center(
        //widget container digunakan untuk menampung widget lain maupun propert.
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
          //Widget: child flatbutton untuk membuat tombol Logout tanpa efek seperti bayangan dll
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            //Widget: child text dalam flatbutton logout
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),

        ),
      ),
    );
  }
}