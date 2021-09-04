import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration
                                :TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

/*
import 'package:baratonsupermarket_app/components/product_details.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

// ignore: camel_case_types
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
*/
