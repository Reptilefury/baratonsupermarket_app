import 'package:baratonsupermarket_app/components/products.dart';
import 'package:baratonsupermarket_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:baratonsupermarket_app/pages/size_config.dart';
import 'package:baratonsupermarket_app/pages/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:baratonsupermarket_app/pages/cart.dart';

//my own imports
import 'package:baratonsupermarket_app/components/horizontal_listview.dart';

//import 'components/products.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    return Scaffold(
      appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.deepPurple,
          centerTitle: false,
          title: Text('Baraton Shop'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
            new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                })
          ]),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Ryan'),
              accountEmail: Text('ryanwa@ueab.ac.ke'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.deepPurple),
            ),
            //body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Home Page',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.house,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'My account',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'My Orders',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text(
                  'Shopping Cart',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Favourites',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.help,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(this.context,
                    MaterialPageRoute(builder: (context) => Login()));
              },
              child: ListTile(
                title: Text(
                  'Signout',
                  style: TextStyle(color: Colors.black),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple,),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(this.context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  /*
                  Icons.help,
                  color: Colors.deepPurple,*/
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          //image_carousel,
          Divider(),
          //padding  widget
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /* GestureDetector(
            onTap: ()=> print('See All'),
            child: Text(
              'See All',
              style: TextStyle(color: Theme.of(context).primaryColor,
              fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
          ),*/
          //Horizontal List view starts begins here
          HorizontalList(),
          /*  Divider(),
          Container(
            height: 50,
            child: SpecialOffers(),
          ),*/
          Divider(),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  //alignment: Alignment.centerLeft,
                  child: new Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //grid view
          Container(
            height: 950.0,
            child: Products(),
            //page for products includes height and page scroll
          ),
        ],
      ),
    );
  }
}
/*class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child:  Container(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20),),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(10),)
          ],
        ),
      ),
    ));
  }
}*/
