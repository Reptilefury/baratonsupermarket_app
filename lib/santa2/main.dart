
//import 'package:baratonsupermarket_app/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom/santa2/pages/home.dart';



import 'components/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   home: HomePage(),
    //home: Login()F,
  ));
}

