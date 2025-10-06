import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/service/api_service.dart';
import 'package:payment/core/util/api_keys.dart';
import 'package:payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/features/checkout/data/models/init_payment_sheet_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );

    var paymetIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymetIntentModel;
  }

  Future initPayemtSheet({
    required InitPaymentSheetModel initPaymentSheetModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemerlKeySecret,
        customerId: initPaymentSheetModel.customerId,
        merchantDisplayName: "ammar",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetModel = InitPaymentSheetModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemerlKeySecret: ephemeralKeyModel.secret!,
    );
    await initPayemtSheet(initPaymentSheetModel: initPaymentSheetModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {"customer": customerId},
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2025-09-30.clover",
      },
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
