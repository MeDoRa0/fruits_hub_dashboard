import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_view_body_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/updtae_order_builder.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'order_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الطلبيات'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<FetchOrdersCubit>(
            create: (context) => FetchOrdersCubit(
              getIt<OrdersRepo>(),
            ),
          ),
          BlocProvider<UpdateOrderCubit>(
            create: (context) => UpdateOrderCubit(
              getIt<OrdersRepo>(),
            ),
          ),
        ],
        child: UpdtaeOrderBuilder(child: OrdersViewBodyBuilder()),
      ),
    );
  }
}
