import 'package:flutter/material.dart';
import 'package:payment/core/util/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.text, required this.price});
  final String text, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppStyles.semiBold24),
        Spacer(),
        Text(price, style: AppStyles.semiBold24),
      ],
    );
  }
}
