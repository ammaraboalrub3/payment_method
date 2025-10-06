import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';

PaymentIntentInputModel getDummyPayment() {
  return PaymentIntentInputModel(
    amount: 52.00,
    currency: "usd",
    customerId: "cus_TBIkH6bnNkrSOo",
  );
}
