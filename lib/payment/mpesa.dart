/*import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:mpesa_flutter_plugin/payment_enums.dart';

class LipaNaMpesa extends StatefulWidget {
  const LipaNaMpesa({Key key}) : super(key: key);

  @override
  _LipaNaMpesaState createState() => _LipaNaMpesaState();
}
//174379
//host: "mpesa-requestbin.herokuapp.com",
//bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919
/*callBackURL:
scheme: "https",
host: "mpesa-requestbin.herokuapp.com",
path: "/1hhy6391"
baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
*/
class _LipaNaMpesaState extends State<LipaNaMpesa> {
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
    return Container();
  }
}
*/