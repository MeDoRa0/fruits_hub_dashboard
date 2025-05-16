import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImpl(this._databaseService);

  @override
  Stream<Either<Failuers, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in _databaseService.fetchStreamData(
          path: BackendEndpoint.ordersCollection)) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } on FirebaseException catch (e) {
      yield Left(
        ServerFailuer(
          message: e.message.toString(),
        ),
      );
    }
  }
}
