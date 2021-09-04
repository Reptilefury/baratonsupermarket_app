/*

import 'package:baratonsupermarket_app/pages/cart_products.dart';
import 'package:flutter/material.dart';
//imports
import 'package:baratonsupermarket_app/components/products.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white70,
        title: Center(child: Text('Cart', style: TextStyle(color: Colors.deepPurple),)),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,
          color: Colors.deepPurple
          ), onPressed: (){})
        ],
      ),
      body: new  Cart_products() ,
      bottomNavigationBar: new Container(
        height: 100,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\KSh230"),
            )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10, top: 8.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Expanded(child: Container(

                 // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: new MaterialButton(onPressed: (){},
                    child: new Text("Check out", style: TextStyle(color: Colors.white),),
                    color: Colors.deepPurple,

                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

*//*

import 'package:flutter/foundation.dart';
class CartItem{
  final String id;
  final String name;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price});
}
class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items{
    return {..._items};
  }
  int get itemCount{
    return _items.length;
  }
  void addItem( String pdtid,String name, String quantity, String price){
    if(_items.containsKey(pdtid)){
      _items.update(pdtid, (existingCartItem) => CartItem)
    }
  }
}
*/
