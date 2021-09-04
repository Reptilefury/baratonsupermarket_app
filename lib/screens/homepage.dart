import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/home_body.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../screens/cart_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Baraton SuperMarket App'),
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
        body: HomeBody());
  }
}
/*showBarModalBottomSheet(
context: context,
builder: (context) => Container(
color: Colors.white,
child: ShoppingCartWidget(),
),
);*/
