import 'package:flutter/material.dart';
import 'package:payment/core/util/app_styles.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.text, required this.value});

  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppStyles.regular18),
        Spacer(),
        Text(value, style: AppStyles.bold18),
      ],
    );
  }
}
