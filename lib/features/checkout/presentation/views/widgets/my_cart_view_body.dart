import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/util/app_images.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/core/widgets/custom_divider.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Expanded(child: Image.asset(Assets.imagesCart)),
          SizedBox(height: 15),
          OrderInfoItem(text: "Order Subtotal", price: r"$42.97"),
          OrderInfoItem(text: "Discount", price: r"$0"),
          OrderInfoItem(text: "Shipping", price: r"$8"),
          SizedBox(height: 17),
          CustomDivider(),
          SizedBox(height: 15),
          TotalPrice(text: "Total", price: r"$50.97"),
          SizedBox(height: 15),
          CustomButton(
            onTap: () {
              //Navigator.pushNamed(context, PaymentDetails.routeName);
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: PaymentMethodBottomSheet(),
                  );
                },
              );
            },
            text: "Complete Payment",
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
