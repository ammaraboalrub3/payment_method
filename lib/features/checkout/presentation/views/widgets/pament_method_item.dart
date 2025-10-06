import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/util/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    required this.isActive,
  });

  final String image;

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
      width: 104,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: isActive
              ? AppColors.kPrimaryColor
              : Colors.black.withValues(alpha: 0.5),
        ),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(image),
    );
  }
}
