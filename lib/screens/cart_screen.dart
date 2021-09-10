import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/orders.dart';
import 'package:flutter_ecom/payment/mpesa.dart';
import 'package:flutter_ecom/widgets/custom_btn.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
        ),
      ), */
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name)),
          ),
          CheckoutButton(
            cart: cart,
          ),
          // FlatButton(
          //     onPressed: () {
          //     },
          //     child: Text(
          //       'Checkout',
          //       style: TextStyle(color: Colors.blue, fontSize: 20),
          //     ))
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: 10.0,
          partyA: "254740870184",
          partyB: "174379",
          //Lipa na Mpesa Online ShortCode
          callBackURL: Uri(
              scheme: "https",
              host: "mpesa-requestbin.herokuapp.com",
              path: "/1hhy6391"),
          //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
          accountReference: "Baraton Supermarket App",
          phoneNumber: "254740870184",
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "purchase",
          passKey:
          "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      //This passkey has been generated from Test Credentials from Safaricom Portal

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Pay",
      onTap: widget.cart.totalAmount <= 0
          ? null:()async{
        await Provider.of<Orders>(context, listen: false).addOrder(
            widget.cart.items.values.toList(), widget.cart.totalAmount);
        widget.cart.clear();

              lipaNaMpesa();
            },
    );

    /*FlatButton(
      child: Text('Checkout'),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },
    );*/
  }
}
