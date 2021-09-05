import 'package:flutter/material.dart';
import 'package:flutter_ecom/santa2/pages/home.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key key}) : super(key: key);

  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,),
      body: Container(
        height: 150,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child:  IconButton(icon: Icon(Icons.search,
              color: Colors.deepPurple
          ), onPressed: (){HomePage2();})
      ),
    );
  }
}
