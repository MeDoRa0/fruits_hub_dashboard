import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String status;

  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.status,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'] as double,
      uID: json['uID'] as String,
      shippingAddressModel:
          ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: List<OrderProductModel>.from(
          (json['orderProducts'] as List)
              .map((e) => OrderProductModel.fromJson(e))),
      paymentMethod: json['paymentMethod'] as String,
      status: json['status'] as String,
    );
  }

  toJson() => {
        'totalPrice': totalPrice,
        'uID': uID,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };

  toEntity() => OrderEntity(
      status: OrderStatusEnum.values
          .firstWhere((element) => element.name == status),
      totalPrice: totalPrice,
      uID: uID,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProductEntity: orderProducts.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod);
}
