import 'package:flutter/material.dart';
import 'package:flutter_ecom/constants/controllers.dart';
import 'package:flutter_ecom/widgets/custom_text.dart';
import 'package:flutter_ecom/widgets/home_body.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../screens/cart_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(
                () => UserAccountsDrawerHeader(
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                  ),
                     accountName: Text(userController.userModel.value.name ?? ""),
                  accountEmail:
                      Text(userController.userModel.value.email ?? ""),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "Home Page",
                ),
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "My Account",
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "My Orders",
                ),
                onTap: () async {
                  // paymentsController.getPaymentHistory();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "Shopping Cart",
                ),
                onTap: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        Container(color: Colors.white, child: CartScreen()
                            //ShoppingCartWidget(),
                            ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "Payments History",
                ),
                onTap: () async {
                  // paymentsController.getPaymentHistory();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.indigo,
                ),
                title: CustomText(
                  text: "Favourites",
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
                title: CustomText(
                  text: "Settings",
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.indigo,
                ),
                title: CustomText(
                  text: "About",
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                    userController.signOut();
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.indigo,
                ),
                title: Text("Log out"),
              ),
            ],
          ),
        ),
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
