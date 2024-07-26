// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js' as js;

Future<String?> connectToPetraWallet() async {
  //var
  String address = "Empty";
  try {
    // Check if 'aptos' is available in the global window object
    if (js.context.hasProperty('aptos')) {
      var wallet = js.context['aptos'];

      // Attempt to connect to the wallet
      var response = await wallet.callMethod('connect');
      print(response); // { address: string, ... }

      // Retrieve account information
      var account = await wallet.callMethod('account');
      print(account); // { address: string, ... }
      address = account['address'];
      //return address;
    } else {
      // If 'aptos' is not available, redirect to Petra Wallet website
      js.context.callMethod('open', ['https://petra.app/', '_blank']);
    }
  } catch (e) {
    // Handle any exceptions that occur during connection or account retrieval
    print('Error connecting to Petra Wallet: $e');
    showDialog(
      context: js.context['flutterBridge']['navigatorKey'].currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content:
              Text('An error occurred while connecting to Petra Wallet: $e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  return address;
}
