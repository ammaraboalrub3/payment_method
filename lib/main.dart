import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/util/api_keys.dart';
import 'package:payment/core/util/app_colors.dart';
import 'package:payment/core/util/helper/bloc_observer.dart';
import 'package:payment/core/util/helper/on_generate_route.dart';
import 'package:payment/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        textTheme: TextTheme().apply(bodyColor: AppColors.mainTextcolor),
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
