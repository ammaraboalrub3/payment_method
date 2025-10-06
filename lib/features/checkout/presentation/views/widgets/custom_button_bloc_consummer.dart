import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/service/paypal_payment.dart';
import 'package:payment/core/service/stripe_payment.dart';
import 'package:payment/core/util/app_colors.dart';
import 'package:payment/core/util/helper/snack_bar.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/payment_success.dart';

class CustomButtonBlocConsummer extends StatelessWidget {
  const CustomButtonBlocConsummer({super.key, required this.isPaypal});

  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFauiler) {
          print(state.errorMessage);
          Navigator.of(context).pop();
          return snackBar(context, state.errorMessage, Colors.red);
        }
        if (state is PaymentSuccess) {
          Navigator.pushReplacementNamed(context, PaymentSuccessView.routeName);
          snackBar(context, "payment success", AppColors.kPrimaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (isPaypal) {
              paypalPayment(context);
            } else {
              stripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          text: "Continue",
        );
      },
    );
  }
}
