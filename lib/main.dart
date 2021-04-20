import 'package:baratonsupermarket_app/pages/home.dart';
import 'package:baratonsupermarket_app/pages/size_config.dart';
import 'package:baratonsupermarket_app/pages/special_offers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:baratonsupermarket_app/pages/cart.dart';
//my own imports
import 'package:baratonsupermarket_app/components/horizontal_listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'components/products.dart';
import 'package:baratonsupermarket_app/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   // home: HomePage(),
    home: Login(),
  ));
}

