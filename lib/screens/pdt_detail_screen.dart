import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecom/screens/cart_screen.dart';
import 'package:flutter_ecom/utils/helpers/showLoading.dart';
import 'package:flutter_ecom/widgets/all_pdts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
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
import 'package:progress_dialog/progress_dialog.dart';
import 'package:lottie/lottie.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/product-detail';

  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ProgressDialog Pr;

  @override
  Widget build(BuildContext context) {
    Pr = new ProgressDialog(context);
    Pr.style(
        message: 'Processing your transaction might take a while, please wait..',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0,
            fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black,
            //fontSize: 19.0,
            fontWeight: FontWeight.w600));
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    Future LipaNaMpesa() async {
      dynamic transactionInitialisation;
      try {
        transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
            businessShortCode: "174379",
            transactionType: TransactionType.CustomerPayBillOnline,
            amount: loadedPdt.price,
            partyA: "254740870184",
            partyB: "174379",
            callBackURL: Uri(
                scheme: "https",
                host: "mpesa-requestbin.herokuapp.com",
                path: "/1hhy6391"),
            accountReference: "Baraton  Supermarket App",
            phoneNumber: "254740870184",
            baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
            transactionDesc: "would you like to purchase ${loadedPdt.name}",
            passKey:
                "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
        print("TRANSACTION RESULT:" + transactionInitialisation.toString());
      } catch (e) {
        print("CAUGHT EXCEPTION:" + e.toString());
      }
    }

    //final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedPdt.name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          //showLoading();
                          /*   Pr.show();
                          Future.delayed(Duration(seconds: 10)).then((value) {
                            Pr.hide().whenComplete(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => SecondScreen()));
                              //after pressing "BUY NOW" process transaction then go to payment was successful screen then create a button that says continue shopping
                              //you could try catching the error to help with screen navigation
                            });
                          });

                          LipaNaMpesa();*/
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text("Choose payment Option:"),
                                  content: Text(
                                    "Choose payment Option: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Center(
                                          child: RaisedButton.icon(
                                              color: Colors.green,
                                              label: Text(
                                                "Lipa na M-pesa",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              icon: Icon(Icons.phone_android, color: Colors.white,),
                                              onPressed: () {
                                                Pr.show();
                                                LipaNaMpesa();
                                                Future.delayed(
                                                        Duration(seconds: 10))
                                                    .then((value) {
                                                  Pr.hide().whenComplete(() {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                MyLottie()));
                                                    //after pressing "BUY NOW" process transaction then go to payment was successful screen then create a button that says continue shopping
                                                    //you could try catching the error to help with screen navigation
                                                  });
                                                });
                                              }),
                                        ),
                                        SizedBox(height:10.0),
                                        Center(
                                          child: RaisedButton.icon(
                                              color: Colors.indigo,
                                              label: Text(
                                                "Pay with Visa",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              icon: Icon(
                                                Icons.payment,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {}),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
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
                  }),
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
            subtitle: new Text("${loadedPdt.description}"
                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                ),
          ),
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
            child: new Text(
              "Recommended for you",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          //SIMILAR PRODUCTS SECTION
          Container(height: 360, child: AllProducts()
              //Similar_products()
              // REMEMBER TO LOAD MORE PRODUCTS
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => Container(
              color: Colors.white,
              child: CartScreen(),
            ),
          );
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.indigo,
          size: 30,
        ),
      ),
    );
  }
}

class MyLottie extends StatelessWidget {
  const MyLottie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Payment Successful"),
      ),*/
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 550,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/packages/lf20_7W0ppe.json"),
                ),
              ),
            ),
          ),
          RaisedButton.icon(
              color: Colors.indigo,
            icon: Icon(Icons.shopping_cart_sharp, color: Colors.white,),
            label: Text(
              "continue Shopping",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>
              HomePage()
              ));
            },
          ),
        ],
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
