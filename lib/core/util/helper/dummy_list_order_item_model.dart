import 'package:payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item_list_model.dart';

ItemListModel getOrder() {
  List<OrderItemsModel> orders = [
    OrderItemsModel(
      name: "apple",
      currency: "USD",
      quantity: 10,
      price: "2.14",
    ),
    OrderItemsModel(
      name: "apple",
      currency: "USD",
      quantity: 12,
      price: "2.55",
    ),
  ];
  return ItemListModel(orders: orders);
}
