import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failuers, List<OrderEntity>>> fetchOrders();
}
