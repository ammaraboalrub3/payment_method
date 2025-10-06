import 'package:flutter/material.dart';
import 'package:payment/core/util/app_styles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  static const routeName = "cart_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart", style: AppStyles.medium25),
      ),
      body: SafeArea(child: MyCartViewBody()),
    );
  }
}
