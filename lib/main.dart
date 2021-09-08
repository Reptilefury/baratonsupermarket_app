import 'package:flutter/material.dart';
import 'package:flutter_ecom/Controllers/appController.dart';
import 'package:flutter_ecom/constants/firebase.dart';
import 'package:flutter_ecom/models/orders.dart';
import 'package:flutter_ecom/models/products.dart';
import 'package:flutter_ecom/screens/authentication/auth.dart';
import 'package:flutter_ecom/screens/pdt_detail_screen.dart';
import 'package:flutter_ecom/splash/splash.dart';
import 'package:flutter_ecom/testscreen.dart';
import 'package:flutter_ecom/widgets/home_body.dart';
import 'package:get/get.dart';
import './screens/homepage.dart';
import 'package:provider/provider.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';
import 'Controllers/authController.dart';

/*void main() {
  runApp(MyApp());
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MpesaFlutterPlugin.setConsumerKey("MYt8fucUMX7rnFWSOP1HMASssTOAOhl3");
  MpesaFlutterPlugin.setConsumerSecret("CuOGhPlpQYEpZOQD");
  await initialization.then((value){
    Get.put(AppController());
    Get.put(UserController());
   // Get.put(ProductsController());
 //   Get.put(CartController());
  //  Get.put(PaymentsController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-commerce App',
        theme: ThemeData(primaryColor: Colors.indigo, accentColor: Colors.white),
        home:  SplashScreen(),
        //HomePage(),
        // AuthenticationScreen(),
        //TestScreen(),
        //HomePage(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
          testScreen.routeName: (ctx) => testScreen(),

        },
      ),

    );

  }
}
