import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecom/santa2/components/horizontal_listview.dart';
import 'package:flutter_ecom/testscreen.dart';
import '../widgets/category.dart';
import '../widgets/all_pdts.dart';

/*class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          'Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 10,
        ),
      //  Category(),
        Center(
            child: Text(
          'Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        AllProducts()
      ],
    );
  }
}*/
class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomebodyState createState() => _HomebodyState();
}

class _HomebodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/coke2.jpeg'),
          AssetImage('images/cokee.jpeg'),
          AssetImage('images/weetabix.jpeg'),
          AssetImage('images/urbanbites.jpg'),
          AssetImage('images/vegetables.jpeg'),
          AssetImage('images/bicc.png'),
          AssetImage('images/suagar.jpg'),
          AssetImage('images/sunlight.jpg'),
        ],
        autoplay: true,
        dotSize: 6.0,
        dotColor: Colors.deepPurple,
        indicatorBgPadding: 2.0,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return ListView(
      children: <Widget>[
        image_carousel,
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'See all  ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        HorizontalList(),
        //Category(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FlatButton(onPressed: () {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => testScreen()));

            },
              child:
              Text(
              'See all  ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ],
        ),
        AllProducts()
      ],
    );
    ;
  }
}
