//add new user:
// email
//password
//name
// driving licence Id.
//Id number.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie_animation/screens/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {

    //TODO update what details you want
    //test feild state
    String email = "";
    String password = "";
    String name = "";
    String ID = "";
    String phonenumber = "";

    //for showing loading
    bool loading = false;

    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            //TODO update this
            'assets/car1.gif',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF333652),
                      Colors.black.withOpacity(.1),
                    ])),
          ),
          Padding(
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
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                // national id number
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.badge ,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                //TODO remove unwanted containers
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.account_box,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'National ID Number',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.account_box,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Licence ID NUmber',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                //college
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.phone_android,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70
                              )
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.white70
                            ),
                          ),
                          style: TextStyle(fontSize: 16,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black),
                      )),
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
                        "Already have an account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
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
                          "Login",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
