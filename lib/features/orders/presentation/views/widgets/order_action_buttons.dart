import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('reject'),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            
            onPressed: () {
              context.read()<UpdateOrderCubit>().updateOrderStatus(
                orderId: orderEntity.orderId,
                status:orderEntity.status,
              );
            },
            child: const Text('accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.processing,
          child: ElevatedButton(
            onPressed: () {
              // Handle reject order action
            },
            child: const Text(' delivered'),
          ),
        ),
      ],
    );
  }
}
