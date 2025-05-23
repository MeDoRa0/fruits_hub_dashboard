part of 'update_order_cubit.dart';

@immutable
sealed class UpdateOrderState {}

final class UpdateOrderInitial extends UpdateOrderState {}

final class UpdateOrderLoading extends UpdateOrderState {}

final class UpdateOrderSuccess extends UpdateOrderState {
  final bool isUpdated;
  UpdateOrderSuccess({
    required this.isUpdated,
  });
}
final class UpdateOrderFailure extends UpdateOrderState {
  final String errorMessage;
  UpdateOrderFailure({
    required this.errorMessage,
  });
}
