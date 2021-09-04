import 'package:flutter/material.dart';
import 'package:flutter_ecom/res.dart';
import 'package:flutter_ecom/santa2/components/product_details.dart';
import 'products.dart';

class HorizontalList extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  // final product_detail_name;
  // final product_detail_new_price;
  // final product_detail_old_price;
  // final product_detail_picture;
  HorizontalList({ this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price,
   // this.product_detail_name, this.product_detail_new_price, this.product_detail_old_price, this.product_detail_picture
});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
       height: 105.0,
      child: ListView(
        physics: BouncingScrollPhysics(parent:AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ]
                ),
                child: Category(
                  
                  image_location: Res.bicc,
                  image_caption: 'pen',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.books,
                  image_caption: 'books',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.bathingsoap,
                  image_caption: 'Soaps',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.coffee,
                  image_caption: 'Beverages',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.milk,
                  image_caption: 'Milk',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.ToothPaste,
                  image_caption: 'images/ToothPaste.png',
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, top:1.2 , right:2.0, bottom:2.0 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ]
                ),
                child: Category(

                  image_location: Res.vasline,
                  image_caption: 'Body Oil',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Category({this.image_location, this.image_caption, this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
        //remember to create route to product details
        child: Container(
          width: 95.0,
          //100
          child: ListTile(
              title: Image.asset(
                image_location,
               width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: new TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              )),
        ),
    );
  }
}
