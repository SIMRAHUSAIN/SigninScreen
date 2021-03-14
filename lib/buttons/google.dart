import 'package:flutter/material.dart';

import 'package:sign_in/firebase/auth.dart';
import 'package:sign_in/screens/loggedIn.dart';

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();

  // signOut() {}
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        //splashColor: Colors.white,
        onPressed: () {
          Authentication().loginWithGoogle().then((result) {
            if (result != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoggedIn()),
                  (route) => false);
            }
          });
          //    signInWithGoogle()
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(width: 1, color: Colors.blue)),
        //highlightElevation: 0,
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/google_logo.png",
                  height: 25,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Sign In with Google",
                        style: TextStyle(fontSize: 20, color: Colors.blue)))
              ],
            )));
  }
}
