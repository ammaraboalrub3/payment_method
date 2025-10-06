import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/errors/failuer.dart';
import 'package:payment/core/service/stripe_service.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/domain/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failuer, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailuer(errorMessage: e.error.message ?? "Oops,error"));
    } catch (e) {
      return left(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
