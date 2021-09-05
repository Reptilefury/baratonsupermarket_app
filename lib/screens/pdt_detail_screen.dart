import 'package:flutter/material.dart';
import 'package:flutter_ecom/screens/cart_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'package:flutter_ecom/widgets/pdt_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ecom/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/screens/pdt_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../models/cart.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/product-detail';
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);


    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    //final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:20),),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    child: CartScreen(),
                  ),
                );
              })
          //=>Navigator.of(context).pushNamed(CartScreen.routeName))
        ],


      ),
    /*  appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white70,
          centerTitle: false,
          title: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>new HomePage()));},
              child: Text('Baraton Shop', style: TextStyle(color: Colors.deepPurple),)),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                onPressed: () {}),
            /* new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})*/
          ]), */
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Image.network(loadedPdt.imgUrl),
                ),
                footer: new Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white70,
                  ),

                  //color: Colors.white70,
                  child: ListTile(
                      leading: new Text(
                        loadedPdt.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      title: new Row(
                        children: <Widget>[
                     /*     Expanded(
                              child: new Text(
                                "\KSh ${widget.product_detail_old_price}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.lineThrough),
                              )), */
                          Expanded(
                              child: new Text(
                                'Price: \Ksh${loadedPdt.price}',

                                //"\KSh ${widget.product_detail_new_price}",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ))
                        ],
                      )),
                )),
          ),
          // the first button +++++++++++++
          Row(
            //the size button +++++++++++++
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Size"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("choose a color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("choose a quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10, top: 8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.indigo,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("Buy now"),
                      ),
                    ),
                  ),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.indigo,
                  ),
                    onPressed: () {

                      cart.addItem(productId, loadedPdt.name, loadedPdt.price);
                    }
                  ),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.indigo,
                  onPressed: () {
                    //cart.addItem(productId, loadedPdt.name, loadedPdt.price);
                  })
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text(
              "Product details",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            subtitle: new Text(
                "${loadedPdt.description}"
               // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ),),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product name:${loadedPdt.name}, ",
                    style: TextStyle(color: Colors.grey)),
              ),
              /*Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              ), */
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              ),
            ],
          ),
          //Remember to make a product brand

          //include product condition
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text("Recommended for you",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          //SIMILAR PRODUCTS SECTION
         /* Container(
              height: 360,
              child:
              //Similar_products()
              // REMEMBER TO LOAD MORE PRODUCTS
          ),
            */
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPdt.name, loadedPdt.price);
        },
        child: Icon(
          Icons.shopping_cart,color: Colors.indigo,
          size: 30,
        ),
      ),

    );
  }
}














/*import 'package:flutter/material.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:20),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          Text(
            'Price: \Ksh${loadedPdt.price}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPdt.name, loadedPdt.price);
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
} */
