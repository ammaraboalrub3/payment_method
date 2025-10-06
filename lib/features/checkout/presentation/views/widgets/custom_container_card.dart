import 'package:flutter/material.dart';

import 'package:payment/core/util/app_styles.dart';
import 'package:payment/core/widgets/custom_divider.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_master_card.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_info.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class CustomContainerCard extends StatelessWidget {
  const CustomContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text("Thank you!", style: AppStyles.medium25),
            Opacity(
              opacity: 0.8,
              child: Text(
                "your transations was successful",
                style: AppStyles.regular20,
              ),
            ),
            SizedBox(height: 42),
            PaymentInfo(text: "Date", value: "01/24/2023"),
            SizedBox(height: 20),
            PaymentInfo(text: "Time", value: "10:15 AM"),
            SizedBox(height: 20),
            PaymentInfo(text: "To", value: "Sam Louis"),
            SizedBox(height: 30),
            CustomDivider(),
            SizedBox(height: 24),

            TotalPrice(text: "Total", price: r"$50.97"),
            SizedBox(height: 30),
            CustomMasterCard(),
          ],
        ),
      ),
    );
  }
}
