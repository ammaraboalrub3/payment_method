import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/util/helper/dummy_payment_intent_input_model.dart';
import 'package:payment/features/checkout/presentation/manger/cubit/payment_cubit.dart';

void stripePayment(BuildContext context) {
  BlocProvider.of<PaymentCubit>(
    context,
  ).makePayment(paymentIntentInputModel: getDummyPayment());
}
