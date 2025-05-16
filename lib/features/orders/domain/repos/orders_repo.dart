import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failuers, List<OrderEntity>>> fetchOrders();

  Future<Either<Failuers, void>> updateOrder(
      {required OrderStatusEnum status, required String orderId});
}
