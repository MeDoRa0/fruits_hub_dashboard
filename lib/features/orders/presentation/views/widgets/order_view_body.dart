import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_items_listview.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orderEntity});
  final List<OrderEntity> orderEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilterSection(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: OrderItemsListview(
              orderEntity: orderEntity,
            ),
          ),
        ],
      ),
    );
  }
}
