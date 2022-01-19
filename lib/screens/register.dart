// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie_animation/screens/login.dart';
import 'package:lottie_animation/models/user.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'complete_profile.dart';

class Register extends StatefulWidget  {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>{
  final _auth=FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  AppUser userinfo = AppUser();

  @override
  Widget build(BuildContext context) {

    //for showing loading
    bool loading = false;
    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Form(
      key:_formKey,
      child: Scaffold(
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
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                            onChanged:(value){
                              userinfo.email = value;
                            },
                            validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter a valid email ")]),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white70)),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                  // national id number
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
                                  Icons.vpn_key,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value){
                              userinfo.password=value;
                            },
                            validator:MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText: "Password should be at least 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                  "Password should not be greater than 15 characters")
                            ]),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButton(
                      title: 'Register',
                      colour: Color(0xFFFAD02C),
                      onPressed: ()async {
                        if (_formKey.currentState.validate()) {
                          try {
                            final newUser = await _auth
                                .createUserWithEmailAndPassword(
                                email: userinfo.email.trim(), password: userinfo.password.toString());
                            if (newUser != null){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CompleteProfile()),
                              );
                            }
                          }
                          catch(e){
                            print(e);
                          }
                        } else {
                          print("Not Validated");
                        }

                      }),



                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Center(
                        child: Text(
                      "Already have an account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
      ),
    );
  }
}


