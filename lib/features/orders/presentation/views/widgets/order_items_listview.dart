import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrderItemsListview extends StatelessWidget {
  const OrderItemsListview({super.key, required this.orderEntity});
  final List<OrderEntity> orderEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orderEntity.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        return OrderItem(order: orderEntity[index]);
      },
    );
  }
}
