import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in/main.dart';

class LoggedIn extends StatefulWidget {
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("You are Logged In", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            InkWell(
              onTap: () {
                //use authentication logout
              },
              child: Icon(Icons.logout),
            )
          ],
        ),
        body: Container(
            child: Center(
                child: Text("Logged In",
                    style: TextStyle(color: Colors.blue, fontSize: 40)))));
  }
}
