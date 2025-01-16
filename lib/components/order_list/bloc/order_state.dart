part of 'order_bloc.dart';

enum OrderStateStatus { initial, failure, success }

final class OrderState extends Equatable {
  const OrderState(
      {this.status = OrderStateStatus.initial,
      this.orders = const <OrderModel>[]});

  OrderState copyWith({
    List<OrderModel>? orders,
    OrderStateStatus? status,
  }) {
    return OrderState(
        orders: orders ?? this.orders, status: status ?? this.status);
  }

  final OrderStateStatus status;
  final List<OrderModel> orders;
  @override
  List<Object> get props => [status, orders];
}
