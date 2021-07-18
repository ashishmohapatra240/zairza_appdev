import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 140.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Skillkart',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                )),
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                )),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextBox(),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 318.0,
              height: 40.0,
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24.0),
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                onPressed: () async {
                  try {
                    final user = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                  } catch (e) {}
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Don\'t have an account? Register',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                )),
          ),
        ],
      ),
    ));
  }
}

class TextBox extends StatefulWidget {
  @override
  TextBoxState createState() {
    return TextBoxState();
  }
}

class TextBoxState extends State<TextBox> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email Address',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              onChanged: (value) {
                password = value;
              },
            ),
          ),
        ]);
  }
}
