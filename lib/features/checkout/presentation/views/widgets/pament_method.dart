import 'package:flutter/material.dart';
import 'package:payment/core/util/app_images.dart';
import 'package:payment/features/checkout/presentation/views/widgets/pament_method_item.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key, required this.updatePaymentMethod});

  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final List<String> items = const [Assets.imagesCard, Assets.imagesPaypal];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.asMap().entries.map((e) {
        final index = e.key;
        final image = e.value;
        return GestureDetector(
          onTap: () {
            currentIndex = index;
            setState(() {});
            widget.updatePaymentMethod(index: index);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              end: index == items.length - 1 ? 0 : 16,
            ),
            child: PaymentMethodItem(
              image: image,
              isActive: currentIndex == index,
            ),
          ),
        );
      }).toList(),
    );
  }
}
