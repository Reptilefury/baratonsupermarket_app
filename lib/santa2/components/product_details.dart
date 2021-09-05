//import 'package:baratonsupermarket_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/santa2/pages/home.dart';


class ProductDetails extends StatefulWidget {
  static const Color transparent = Color(0x00000000);
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white70,
          centerTitle: false,
          title: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>new HomePage2()));},
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
          ]),
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
                  child: Image.asset(widget.product_detail_picture),
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
                        widget.product_detail_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      title: new Row(
                        children: <Widget>[
                          Expanded(
                              child: new Text(
                            "\KSh ${widget.product_detail_old_price}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.lineThrough),
                          )),
                          Expanded(
                              child: new Text(
                            "\KSh ${widget.product_detail_new_price}",
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
                        color: Colors.deepPurple,
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
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.deepPurple,
                  onPressed: () {})
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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product name",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              ),
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
          Container(
            height: 360,
            child: Similar_products()
          )

        ],
      ),
    );
  }
}
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "Crisps",
      "picture": "images/products/potatolays.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Sunlight",
      "picture": "images/sunlight.jpg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Coke",
      "picture": "images/Zero.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Bic Pen",
      "picture": "images/bicproduct.jpeg",
      "old_price": 25,
      "price": 15,
    },
    {
      "name": "Downy",
      "picture": "images/Downy.jpeg",
      "old_price": 150,
      "price": 140,
    },
    {
      "name": "Fresh Milk",
      "picture": "images/Brooksidemilkd.jpeg",
      "old_price": 70,
      "price": 60,
    },
    {
      "name": "Lays Chips",
      "picture": "images/lays.png",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Exercise Books ",
      "picture": "images/A4books.png",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Soft Drinks",
      "picture": "images/softdrinks.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Sanitizer",
      "picture": "images/handsanitizer.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Bathing Soap",
      "picture": "images/bathingsoapp.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Weetabix",
      "picture": "images/breakfastcereal.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Basmati Rice",
      "picture": "images/BasmatiRice.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Colgate",
      "picture": "images/maxfresh.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "Vasline",
      "picture": "images/Vasline.jpeg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "MacCoffee",
      "picture": "images/maccoffe.jpg",
      "old_price": 50,
      "price": 40,
    },
    {
      "name": "pen",
      "picture":"images/bicc.png",
      "oldd_price":50,
      "price":40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
        this.prod_picture,
        this.prod_old_price,
        this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10, top: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Card(
          child: Hero(
            tag: prod_name,
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //here we pass the values of the product to the product details
                    builder: (context) => new ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_new_price: prod_price,
                      product_detail_old_price: prod_old_price,
                      product_detail_picture: prod_picture,
                    ))),
                child: GridTile(
                    footer: Container(
                      //height: 58,
                      //heigh for prices
                      color: Colors.white70,
                      child: Container(
                        margin: EdgeInsets.only(top: 0.002),
                        decoration: new BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        //tile margin and transparency
                        child: new Row(
                          children: <Widget>[
                            Expanded(
                              child: new Text(
                                prod_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            new Text(
                              "\KSh ${prod_price}",
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    child: Image.asset(
                      prod_picture,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
