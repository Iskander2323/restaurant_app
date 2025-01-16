import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/components/order_list/model/order_model.dart';
import 'package:restaurant_app/components/order_list/repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  OrderBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(OrderState()) {
    on<FetchOrdersEvent>(_fetchOrders);
    on<ChangeOrderStatusEvent>(_changeOrderStatus);
  }

  Future<void> _fetchOrders(
      FetchOrdersEvent event, Emitter<OrderState> emit) async {
    try {
      final placements = await _orderRepository.fetchOrders();
      emit(
          state.copyWith(orders: placements, status: OrderStateStatus.success));
    } on Exception catch (e) {
      log(e.toString(), name: 'PLACEMENT BLOC');
    }
  }

  Future<void> _changeOrderStatus(
      ChangeOrderStatusEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: OrderStateStatus.initial));
    await _orderRepository.changeOrderStatus(event.orderId, event.isPaid);
    await _fetchOrders(FetchOrdersEvent(), emit);
    // emit(state.copyWith(status: OrderStateStatus.success));
  }
}
