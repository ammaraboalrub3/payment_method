import 'package:flutter/material.dart';
import 'package:payment/constants.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_container_card.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_dash.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: khorizantalPadding,
        vertical: 27,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomContainerCard(),

          CustomDash(),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: CustomCircleAvatar(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: CustomCircleAvatar(),
          ),

          CustomCheckIcon(),
        ],
      ),
    );
  }
}
