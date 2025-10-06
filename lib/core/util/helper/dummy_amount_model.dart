import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/details.dart';

AmountModel getAmountModel() {
  var amountModel = AmountModel(
    total: "52.00",
    currency: "USD",
    details: Details(subtotal: "52.00", shipping: "0", shippingDiscount: 0),
  );
  return amountModel;
}
