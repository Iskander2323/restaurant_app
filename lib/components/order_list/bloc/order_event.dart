part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class FetchOrdersEvent extends OrderEvent {}

final class ChangeOrderStatusEvent extends OrderEvent {
  final int orderId;
  final bool isPaid;

  const ChangeOrderStatusEvent({required this.orderId, required this.isPaid});
}
