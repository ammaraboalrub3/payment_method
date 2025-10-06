import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/util/app_images.dart';
import 'package:payment/core/util/app_styles.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),

      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesLogoCard),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Credit Card", style: AppStyles.regular18),
              Opacity(
                opacity: 0.8,
                child: Text("Mastercard **42", style: AppStyles.regular18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
