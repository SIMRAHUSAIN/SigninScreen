import 'package:flutter/material.dart';
import 'package:sign_in/continuewithphone.dart';

class PhoneSignIn extends StatefulWidget {
  @override
  _PhoneSignInState createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContinueWithPhone()));
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
                  "assets/phone.png",
                  height: 25,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Sign In with Phone",
                        style: TextStyle(fontSize: 20, color: Colors.blue)))
              ],
            )));
  }
}
