import 'package:flutter/material.dart';
import 'authentication.dart';
import 'login.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Future<Model> fetchModel() async {
//   final response = await http.get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Model.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

Future<List<Model>> fetchModel() async {
  final response = await http.get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Model>((json) => Model.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load Doa');
  }
}
//Statefulwidget digunakan untuk menampilkan data-data yang bersifat dinamis (dapat mengalami perubahan)
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final String apiUrl = "https://reqres.in/api/users?per_page=15";
  // Future<List<dynamic>> _fecthDataUsers() async {
  //   var result = await http.get(Uri.parse(apiUrl));
  //   return json.decode(result.body)['data'];
  // }
  late Future<List<Model>> futureModel;
  // late Future<Model> futureModel;

  @override
  void initState() {
    super.initState();
    futureModel = fetchModel();
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
      // body: Center(
      //   child: FutureBuilder<Model>(
      //     future: futureModel,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Text('$snapshot.data!.doa');
      //       } else if (snapshot.hasError) {
      //         return Text('${snapshot.error}');
      //       }
      //       // By default, show a loading spinner.
      //       return const CircularProgressIndicator();
      //     },
      //   ),
      // ),
      body: FutureBuilder<List<Model>>(
          future: futureModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFC1C1C1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${snapshot.data![index].doa}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].ayat}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].latin}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].artinya}"),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
            },
        ),

        // child: FutureBuilder<List<dynamic>>(
        //   future: _fecthDataUsers(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           padding: EdgeInsets.all(10),
        //           itemCount: snapshot.data.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return ListTile(
        //               leading: CircleAvatar(
        //                 radius: 30,
        //                 backgroundImage:
        //                 NetworkImage(snapshot.data[index]['avatar']),
        //               ),
        //               title: Text(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']),
        //               subtitle: Text(snapshot.data[index]['email']),
        //             );
        //           });
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
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