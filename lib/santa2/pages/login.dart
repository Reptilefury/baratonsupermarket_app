
//import 'package:baratonsupermarket_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/santa2/pages/home.dart';
import 'package:flutter_ecom/santa2/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;
  bool hidePass = true;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    final User user = await firebaseAuth.currentUser;
    {
    if (user != null) {
    setState(()=>
    isLogedin = true);
    }
    }

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          this.context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignedIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleuser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authresult =
        await firebaseAuth.signInWithCredential(credential);
    final User user = authresult.user;

    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          "id": user.uid,
          "username": user.displayName,
          "profilepicture": user.photoURL,
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("photoURL", user.displayName);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoURL", documents[0]['photoURL']);
      }
      Fluttertoast.showToast(msg: "Logged in successfuly");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          this.context, MaterialPageRoute(builder: (context) => HomePage()));
      //Navigator.push(this.context, MaterialPageRoute(builder: (context)=> HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }

/*  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance.collection(
          "users").where("id", isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id" :firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl
        });
        //insert user to my collection
      }
    } else {

    }
  }*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height /3;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                handleSignedIn();
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'images/google.png',
                  width: 50.0,
                  height: 80.0,
                ),
              ),
            ),
          ),
          /*   Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),*/
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
                        color: Colors.deepPurple[50],
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
                        color: Colors.deepPurple[50],
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(

                            title: TextFormField(
                              controller: _passwordTextController,
                              obscureText: hidePass,
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
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye, size: 20.0,),
                                  onPressed: () {
                                   setState(() {
                                     hidePass = false;
                                   });
                                  })
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
                            onPressed: () {
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0),
                            ),
                          ),
                        )),
                    Divider(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup() ));} ,
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.bold),
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
      bottomNavigationBar: Container(
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
            )),
        /*child: Padding(
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
        ),*/
      ),
    );
  }
}
