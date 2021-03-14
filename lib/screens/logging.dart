import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/buttons/google.dart';
import 'package:sign_in/buttons/phonenum.dart';

class Logging extends StatefulWidget {
  @override
  _LoggingState createState() => _LoggingState();
}

class _LoggingState extends State<Logging> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Image.asset("assets/login.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login System",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 30),
        //getsha1 key and authenticate
        SizedBox(
            height: 60,
            width: 330,
            child: TextField(
                controller: _controller1,
                maxLines: 2,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1))))),
        SizedBox(height: 20),
        SizedBox(
            height: 60,
            width: 330,
            child: TextField(
                controller: _controller2,
                maxLines: 2,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1))))),
        SizedBox(height: 20),
        // RaisedButton(
        // //splashColor: Colors.white,
        // onPressed: () {
        //   Authentication().loginWithGoogle().then((result) {
        //     if (result != null) {
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => LoggedIn()),
        //           (route) => false);
        //     }
        //   });
        //   //    signInWithGoogle()
        // },
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //     side: BorderSide(width: 1, color: Colors.blue)),
        // //highlightElevation: 0,
        // color: Colors.white,
        // child: Padding(
        //     padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset(
        //           "assets/google_logo.png",
        //           height: 25,
        //         ),
        //         Padding(
        //             padding: EdgeInsets.only(left: 10),
        //             child: Text("Sign In with Google",
        //                 style: TextStyle(fontSize: 20, color: Colors.blue)))
        //       ],
        //     )));
        SizedBox(
            height: 45,
            width: 180,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(width: 1, color: Colors.blue)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                      Text("Login",
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                    ],
                  ),
                ))),
        SizedBox(height: 15),
        GoogleButton(),

        SizedBox(
          height: 15,
        ),
        PhoneSignIn(),
        // SizedBox(
        //     height: 50,
        //     width: 220,
        //     child: RaisedButton(
        //         onPressed: () {},
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //             side: BorderSide(width: 1)),
        //         color: Colors.blue[300],
        //         child: Text("SignIn with Phone",
        //             style: TextStyle(color: Colors.white)))),
        SizedBox(
          height: 15,
        ),
        RaisedButton(
            //splashColor: Colors.white,
            onPressed: () {},
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
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Anonumous SignIn",
                            style: TextStyle(fontSize: 20, color: Colors.blue)))
                  ],
                )))
      ],
    ));
  }

  void signInAnonymously() {
    _firebaseAuth.signInAnonymously().then((result) {
      setState(() {
        final User user = result.user;
        if (user.isAnonymous) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Logging()),
              (route) => false);
        }
      });
    });
  }
}
