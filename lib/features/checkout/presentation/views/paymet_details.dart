import 'package:flutter/material.dart';
import 'package:payment/core/util/app_styles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_details_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});
  static const routeName = "payment_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment Details", style: AppStyles.medium25),
      ),
      body: SafeArea(child: PaymentDetailsBody()),
    );
  }
}
