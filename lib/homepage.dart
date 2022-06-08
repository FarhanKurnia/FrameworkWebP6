import 'package:flutter/material.dart';
import 'authentication.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  final String apiUrl = "https://reqres.in/api/users?per_page=15";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }
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
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        NetworkImage(snapshot.data[index]['avatar']),
                      ),
                      title: Text(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']),
                      subtitle: Text(snapshot.data[index]['email']),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
      // body:ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index){
      //     return Container(
      //       height: 300,
      //       width: 300,
      //       color: myColor[index],
      //     );
      //   },
      // ),
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
//     );
//   }
// }