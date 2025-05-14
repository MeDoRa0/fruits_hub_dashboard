import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProductEntity;
  final OrderEnum status;

  final String paymentMethod;

  OrderEntity(
      {required this.totalPrice,
      required this.uID,
      required this.status,
      required this.shippingAddressEntity,
      required this.orderProductEntity,
      required this.paymentMethod});
}
