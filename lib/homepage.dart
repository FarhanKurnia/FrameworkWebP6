import 'package:flutter/material.dart';
// Import untuk class Auth
import 'authentication.dart';
// Import untuk class login
import 'login.dart';
// Import untuk class model
import 'model.dart';
// Import package untuk http request
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Fungsi ini digunakan untuk fetch dari class model
// Future dengan operasi asynchronus
// Future object ini akan  merepresentasikan nilai atau error kedepannya.
Future<List<Model>> fetchModel() async {
  // Variabel final untuk mendefinsikasi dan melakukan http request get ke API tujuan
  // Disini saya menggunakan open API yang berisi doa harian
  final response = await http.get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));
  // Kondisi jika status http request bernilai 200 (Success) maka akan melakukan decode, parsing dan mapping dari Json yang diterima
  // Dan jika status Http request tidak bernilai 200 (Success) maka akan mengirimkan error exception Failed to load data
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
  late Future<List<Model>> futureModel;
  // Digunakan untuk memanggil fungsi fetch dalam initState ()
  // Method build tidak direkomendasikan untuk memanggil API.
  // Jadi fungsi fetchmodel di dalam initState() karena hanya dipanggil 1 kali saja
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
        // Widget action untuk log out yang letaknya nanti berada di app bar
        actions: <Widget>[
          // Widget untuk tombol logout yang berisi icon dan action jika tombol
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            // Jika ditekan akan memanggil class controller auth dan menjalankan fungsi signout
            // Lalu akan diarahkan pada halaman login
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
      // Bagian Body yang didalamnya berisi list dari model menggunakan futureBuilder
      // FutureBuilder mmenerima future dan builder. future adalah futureModel dan builder bertanggung jawab dalam melakukan render screen.
      body: FutureBuilder<List<Model>>(
          future: futureModel,
          builder: (context, snapshot) {
            // Jika data JSON ada isinya maka akan menjalankan fungsi-fungsi widget di bawah untuk menampilkan data nya
            if (snapshot.hasData) {
              // Widget List View
              return ListView.builder(
                // Digunakan untuk menghitung rentang dari data yang diambil yang nantinya akan menjadi acuan atau index dari container yang akan dibuat
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    // Mengatur posisi margin dan padding
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      // Warna pada box container
                      color: Color(0xFFC1C1C1),
                      // Border pada box container agar tidak lancip
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Digunakan untuk menampilkan value dari doa sesuai index nya index berapa
                        // jadi array index ini akan melakukan perulangan sehingga seluruh array akan ditampilkan atau dirender
                        Text("${snapshot.data![index].doa}",
                          // Bagian ini untuk styling text nya dengan size font 18 dan huruf tebal karena merupakan judul dari doa
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Digunakan untuk memberikan ruang dengan tinggi 10
                        SizedBox(height: 10),
                        // Digunakan untuk menampilkan value dari ayat sesuai indexnya di index berapa
                        // Array index nya juga akan melakukan perulangan juga sesuai dengan length dari erray nya
                        // Selain itu sizedbox juga digunakan untuk memberikan ruang antar baris
                        Text("${snapshot.data![index].ayat}"),
                        // Digunakan untuk menampilkan value dari ayat sesuai indexnya di index berapa
                        SizedBox(height: 10),
                        // Digunakan untuk menampilkan value dari ayat sesuai indexnya di index berapa
                        Text("${snapshot.data![index].latin}"),
                        SizedBox(height: 10),
                        // Digunakan untuk menampilkan value dari ayat sesuai indexnya di index berapa
                        Text("${snapshot.data![index].artinya}"),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
                // Jika data nya JSON tidak ada maka akan menampilkan error fetching nya
               // Hal ini memudahkan dalam proses fetching untuk debuging jika fetching gagal
                return Text('${snapshot.error}');
            }
            // Secara default ketika data sedang di load maka akan menamilkan animasi loadong yang berputar
            // Hal ini sebagai tanda untuk pengguna bahwa data sedang proses fething dan ditampilkan
            return Center(child: CircularProgressIndicator());
            },
        ),
    );
  }
}