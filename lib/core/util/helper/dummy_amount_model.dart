import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/details.dart';

AmountModel getAmountModel() {
  var amountModel = AmountModel(
    total: "100",
    currency: "USD",
    details: Details(subtotal: "100", shipping: "0", shippingDiscount: 0),
  );
  return amountModel;
}
