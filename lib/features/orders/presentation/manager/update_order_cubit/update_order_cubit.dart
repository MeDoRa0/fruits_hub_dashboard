import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;
  Future<void> updateOrder({
    required String orderId,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrder(
      status: status,
      orderId: orderId,
    );
    result.fold(
      (l) => emit(UpdateOrderFailure(errorMessage: l.message)),
      (r) => emit(UpdateOrderSuccess(isUpdated: true)),
    );
  }
}
