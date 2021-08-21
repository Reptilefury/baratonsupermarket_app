import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/home/widgets/products.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/screens/payments/payments.dart';
import 'package:untitled/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "Baraton SuperMarket",
            size: 24,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white,),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(()=>UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo
                ),
                  accountName: Text(userController.userModel.value.name ?? ""),
                  accountEmail: Text(userController.userModel.value.email ?? ""))),
              ListTile(
                leading: Icon(Icons.book),
                title: CustomText(
                  text: "Payments History",
                ),
                onTap: ()async {
                 paymentsController.getPaymentHistory();
                },
              ),
              ListTile(
                onTap: () {
                  userController.signOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white30,
          child: ProductsWidget(),
        ),

    );
  }
}
