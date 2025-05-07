import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/order_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardView(),
      );
    case AddProductView.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductView(),
      );
    case OrderView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OrderView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
