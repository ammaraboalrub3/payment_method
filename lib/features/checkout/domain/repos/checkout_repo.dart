import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failuer.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failuer, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
