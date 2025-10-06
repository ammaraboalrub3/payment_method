import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/features/checkout/presentation/views/payment_success.dart';
import 'package:payment/features/checkout/presentation/views/paymet_details.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MyCartView.routeName:
      return MaterialPageRoute(builder: (context) => MyCartView());
    case PaymentDetails.routeName:
      return MaterialPageRoute(builder: (context) => PaymentDetails());
    case PaymentSuccessView.routeName:
      return MaterialPageRoute(builder: (context) => PaymentSuccessView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
