import 'package:flutter/material.dart';
import 'authentication.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> myColor = [Colors.red,Colors.yellow,Colors.green,Colors.blue,Colors.black];
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              AuthenticationHelper()
                  .signOut()
                  .then((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (contex) => Login()),
              ));
            },
          )
        ],
      ),
      body:ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return Container(
            height: 300,
            width: 300,
            color: myColor[index],
          );
        },
      ),
      //membuat body menjadi berada di tengah
      // body: Center(
      //   //widget container digunakan untuk menampung widget lain maupun propert.
      //   child: Container(
      //     height: 50,
      //     width: 150,
      //     decoration: BoxDecoration(
      //         color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
      //     //Widget: child flatbutton untuk membuat tombol Logout tanpa efek seperti bayangan dll
      //     child: FlatButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       //Widget: child text dalam flatbutton logout
      //       child: Text(
      //         'Log out',
      //         style: TextStyle(color: Colors.white, fontSize: 15),
      //       ),
      //     ),
      //
      //   ),
      // ),
    );
  }
}