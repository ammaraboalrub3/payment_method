import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_success_view_body.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  static const routeName = "payment_success_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: PaymentSuccessViewBody()));
  }
}
