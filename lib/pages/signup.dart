import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baratonsupermarket_app/pages/home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
   String gender;
  bool loading = false;
  bool isLogedin = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: Colors.deepPurple.shade900),
        ),
      ),*/

      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 520,
              child: Image.asset(
                'images/shoocart.png',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                //height: 300,
                /*  width: 450.0,
                height: 650.0*/
              ),
            ),

            //TODO:: make a UEAB logo
          ),
      /*    GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'images/google.png',
                width: 50.0,
                height: 80.0,
              ),
            ),
          ),*/
           Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: new Container(
              height: 500,
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/ueablogo.png',
                width: 150.0,
                height: 150.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 12.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                              hintText: "Full name",
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.deepPurple[900],
                              ),
                              //  border: OutlineInputBorder().no,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The name field cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 12.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.deepPurple[900],
                              ),
                              //  border: OutlineInputBorder().no,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please make sure your email is valid';
                                else
                                  return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 12.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.deepPurple[900],
                              ),
                              //  border: OutlineInputBorder().no,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "the password has to be atleast 6 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 12.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              icon: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.deepPurple[900],
                              ),
                              //  border: OutlineInputBorder().no,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "the password has to be atleast 6 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 12.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepPurple[900],
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0),
                            ),
                          ),
                        )),
              /*      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),*/

                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: InkWell(
                          onTap: () {Navigator.pop(context);},
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        )
                        /*RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          children: [
                            TextSpan(
                                text:
                                    "Don't have an account? Click here to create one"),
                            TextSpan(
                                text: "sign up!",
                                style: TextStyle(color: Colors.deepPurple[900]))
                          ],
                        ),
                      ),*/
                        ),

                    //Expanded(child: Container())
                    /* Divider(
                      height: 50,
                      color: Colors.white,
                    ),*/
                    // SizedBox(height: 10, ),
                    /*  Text(
                      "Other Sign in options",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),*/
                    /* Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red[700],
                          //color: Colors.deepPurple[900],
                          elevation: 0.0,
                          child: Container(
                            child: MaterialButton(
                              onPressed: () {
                                handleSignedIn();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Google Sign in ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0),
                              ),
                            ),
                          ),
                        )),*/
                  ],
                ),
              ),
            ),
          ),
          /*        Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('images /google.png',
              width: 100.0,
              height: 80.0,
            ),
          ),*/
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
              ),
            ),
          ),
        ],
      ),
     /* bottomNavigationBar: Container(
        height: 60,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.red[700],
              //color: Colors.deepPurple[900],
              elevation: 0.0,
              child: Container(
                child: MaterialButton(
                  onPressed: () {
                    //handleSignedIn();
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "Google Sign in ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                ),
              ),
            )),
        *//*child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Colors.deepPurple[900],
                  onPressed: () {
                    handleSignedIn();
                  },
                  child: Text(
                    "Sign in / Sign up with google",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.0
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*//*
      ),*/
    );
  }
}
