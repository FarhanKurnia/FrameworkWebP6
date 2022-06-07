import 'package:flutter/material.dart';
import 'package:loginpage/login.dart';
import 'authentication.dart';
import 'homepage.dart';
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
          //Tittle halaman login
          title: Text("Register"),
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
                    child: Image.asset('asset/images/flutter-logo-bird.png')
                  ),
                ),
              ),
              //digunakan untuk memberikan Padding
              // SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SignupForm(),
              ),

              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  Text('Already here  ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38,fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/signup');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    //Widget: child untuk text flatbutton hyperlink register atau Create Account
                    child: Text(
                      'Get Logged in Now!', style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;
  bool _obscureText = false;

  bool agree = false;

  final pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    var space = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
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

          space,

          // password
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          space,
          // confirm passwords
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            validator: (value) {
              if (value != pass.text) {
                return 'password not match';
              }
              return null;
            },
          ),
          space,
          // name
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              name = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),

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
              Flexible(
                child: Text(
                    'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          // signUP button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signUp(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
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
              child: Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}