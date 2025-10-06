import 'package:flutter/material.dart';
import 'package:payment/constants.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_button_bloc_consummer.dart';
import 'package:payment/features/checkout/presentation/views/widgets/pament_method.dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: khorizantalPadding,
        vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethod(updatePaymentMethod: updatePaymentMethod),
          SizedBox(height: 24),
          CustomButtonBlocConsummer(isPaypal: isPaypal),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
