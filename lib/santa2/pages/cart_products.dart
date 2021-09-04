/*import 'package:flutter/material.dart';
import 'package:baratonsupermarket_app/components/products.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Petroleum Jelly",
      "picture": "images/Vasline.jpeg",
      "price": 40,
      "Size": "500g",
      "color": "Blue",
      "Quantity": 1,
    },
    {
      "name": "Hand Sanitizer",
      "picture": "images/handsanitizer.jpeg",
      "price": 40,
      "Size": "500ml",
      "color": "Grey",
      "Quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["Size"],
            cart_prod__price: Products_on_the_cart[index]["price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_old_price;
  final cart_prod__price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_old_price,
      this.cart_prod__price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120,
        child: ListTile(
          // THis is the leading section
          leading: new Image.asset(
            cart_prod_picture,
            width: 80.0,
            height: 80.0,
          ),
          title: new Text(
            cart_prod_name,
          ),
          //subtitle section
          subtitle: new Column(
            children: <Widget>[
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                //ROW INSIDE THE COLUMN
                children: <Widget>[
                  //includes section of the size of the product
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text("Size:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_size,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  // ====This section that includes the product color

                  new Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8.0, 8.0, 8.0),
                    child: new Text("Color:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_color,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  )
                ],
              ),
              //==== THIS SECTION HAS THE PRODUCT PRICING
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "\KSh${cart_prod__price}",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              ),
            ],
          ),
          trailing: new Column(
            children: <Widget>[
              InkWell(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "+",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
*//*
                onTap: () {},
*//*
              ),
              SizedBox(
                height: 10,
              ),
              Text("$cart_prod_qty"),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "+",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              *//* Container(
                height:40,
                child: Expanded(

                    child: IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){})),
              ),
              Text("$cart_prod_qty"),
              Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_down),
                  onPressed:(){}
                  )),*//*
            ],
          ),
        ),
      ),
    );
  }
}*/
