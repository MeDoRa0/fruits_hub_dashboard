import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({
    super.key,
  });

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrderViewBody(
            orderEntity: state.orders,
          );
        } else if (state is FetchOrdersFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Skeletonizer(
            child: OrderViewBody(
              orderEntity: [
                getDummyOrders(),
                getDummyOrders(),
              ],
            ),
          );
        }
      },
    );
  }
}
