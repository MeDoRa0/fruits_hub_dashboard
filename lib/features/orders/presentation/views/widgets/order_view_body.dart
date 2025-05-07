import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_items_listview.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

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
              orderEntity: [
                getDummyOrders(),
                getDummyOrders(),
                getDummyOrders(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
