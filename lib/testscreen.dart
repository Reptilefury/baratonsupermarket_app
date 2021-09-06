import 'package:flutter/material.dart';
import 'package:flutter_ecom/santa2/pages/home.dart';
import 'package:flutter_ecom/widgets/all_pdts.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key key}) : super(key: key);
  static const routeName = '/testScreen';


  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,title: Text('All products'),),
      body:  ListView(children: [
        Container(
            height: 1000,
            child:
            AllProducts()
          //Similar_products()
          // REMEMBER TO LOAD MORE PRODUCTS
        ),
      ],)

    );
  }
}
