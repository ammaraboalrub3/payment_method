import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/util/api_keys.dart';
import 'package:payment/core/util/helper/dummy_amount_model.dart';
import 'package:payment/core/util/helper/dummy_list_order_item_model.dart';
import 'package:payment/core/util/helper/snack_bar.dart';
import 'package:payment/features/checkout/presentation/views/payment_success.dart';

void paypalPayment(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientIdKey,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": getAmountModel().toJson(),
            "description": "The payment transaction description.",

            "item_list": getOrder().toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushNamedAndRemoveUntil(
            context,
            PaymentSuccessView.routeName,
            (route) {
              if (route.settings.name == "/") {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          log("onError: $error");
          snackBar(context, error.toString(), Colors.red);
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          snackBar(context, "cancelled", Colors.red);
          Navigator.pop(context);
        },
      ),
    ),
  );
}
