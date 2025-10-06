import 'package:flutter/material.dart';
import 'package:payment/core/util/app_colors.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xffd9d9d9),

        child: CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.kPrimaryColor,
          child: Icon(Icons.check, size: 50, color: Colors.white),
        ),
      ),
    );
  }
}
