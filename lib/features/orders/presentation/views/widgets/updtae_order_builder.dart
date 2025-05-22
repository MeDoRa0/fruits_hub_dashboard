import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdtaeOrderBuilder extends StatelessWidget {
  const UpdtaeOrderBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Order updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is UpdateOrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is UpdateOrderLoading, child: child);
      },
    );
  }
}
