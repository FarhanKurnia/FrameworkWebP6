import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
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