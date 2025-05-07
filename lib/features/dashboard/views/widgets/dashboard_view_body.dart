import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/order_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: 'اضافة منتج',
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'عرض الطلبيات',
            onPressed: () {
              Navigator.pushNamed(context, OrderView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
