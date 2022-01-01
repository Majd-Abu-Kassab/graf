import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lottie_animation/screens/login.dart';
import 'package:lottie_animation/screens/register.dart';

import 'AdminLoginScreen.dart';

class SignInOrRegister extends StatefulWidget {
  @override
  _SignInOrRegisterState createState() => _SignInOrRegisterState();
}

class _SignInOrRegisterState extends State<SignInOrRegister> {
  @override
  Widget build(BuildContext context) {

    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/car1.gif',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF333652),
                      Colors.black.withOpacity(.1),
                    ])),
          ),
          Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 27.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        //TODO update this
                        'Join PARK KING!',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.amberAccent),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AdminCtrl()),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                              child: Text(
                                'Admin LogIn',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.amberAccent),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Center(
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
