import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;
  StreamSubscription? _ordersStreamSubscription;
  void fetchOrders() {
    emit(FetchOrdersLoading());
    _ordersStreamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold((f) {
        emit(FetchOrdersFailure(errorMessage: f.message));
      }, (r) {
        emit(FetchOrdersSuccess(orders: r));
      });
    });
  }

  @override
  Future<void> close() {
    _ordersStreamSubscription?.cancel();
    return super.close();
  }
}
