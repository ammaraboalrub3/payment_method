import 'package:flutter/material.dart';
import 'package:payment/core/util/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.text, required this.price});

  final String text, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppStyles.regular18),
        Spacer(),
        Text(price, style: AppStyles.regular18),
      ],
    );
  }
}
