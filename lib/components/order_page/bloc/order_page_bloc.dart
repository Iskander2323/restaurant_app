import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/components/order_list/model/menu_item_model.dart';

part 'order_page_event.dart';
part 'order_page_state.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState> {
  OrderPageBloc() : super(OrderPageState()) {
    on<IncreaseItemCountEvent>(_increaseMenuItemCount);
    on<DecreaseItemCountEvent>(_decreaseMenuItemCount);
    on<FetchMenuItemsEvent>(_fetchMenuItems);
    on<AddMenuItemToOrderListEvent>(_addMenuItemToOrderList);
    on<ClearStateEvent>(_clearState);
  }

  void _clearState(ClearStateEvent event, Emitter<OrderPageState> emit) {
    emit(state.copyWith(orderedMenuItems: []));
  }

  Future<void> _fetchMenuItems(
      FetchMenuItemsEvent event, Emitter<OrderPageState> emit) async {
    final List<MenuItemModel> orderItems = [
      MenuItemModel(
          id: 1, itemName: 'Soup', itemPrice: 500, itemCount: 1, orderId: 0),
      MenuItemModel(
          id: 2, itemName: 'Pasta', itemPrice: 1000, itemCount: 1, orderId: 0),
      MenuItemModel(
          id: 3, itemName: 'Pizza', itemPrice: 1000, itemCount: 1, orderId: 0),
      MenuItemModel(
          id: 4, itemName: 'Salad', itemPrice: 800, itemCount: 1, orderId: 0),
      MenuItemModel(
          id: 5, itemName: 'Coke', itemPrice: 600, itemCount: 1, orderId: 0),
    ];

    emit(state.copyWith(
        status: OrderAddItemsPageStatus.success, menuItems: orderItems));
  }

  void _addMenuItemToOrderList(
      AddMenuItemToOrderListEvent event, Emitter<OrderPageState> emit) {
    emit(state.copyWith(status: OrderAddItemsPageStatus.loading));
    final updatedList = List<MenuItemModel>.from(state.orderedMenuItems)
      ..add(event.menuItem);
    emit(state.copyWith(
        orderedMenuItems: updatedList,
        status: OrderAddItemsPageStatus.success));
  }

  void _increaseMenuItemCount(
      IncreaseItemCountEvent event, Emitter<OrderPageState> emit) {
    emit(state.copyWith(status: OrderAddItemsPageStatus.loading));
    final increasedCount = event.actualCount + 1;
    log(increasedCount.toString());

    final List<MenuItemModel> updatedList = state.orderedMenuItems.map((item) {
      if (item.id == event.itemId) {
        log(item.toString());
        return item.copyWith(itemCount: increasedCount);
      } else {
        return item;
      }
    }).toList();
    emit(state.copyWith(
        status: OrderAddItemsPageStatus.success,
        orderedMenuItems: updatedList));
  }

  void _decreaseMenuItemCount(
      DecreaseItemCountEvent event, Emitter<OrderPageState> emit) {
    emit(state.copyWith(status: OrderAddItemsPageStatus.loading));
    final decreasedCount = event.actualCount - 1;
    if (decreasedCount == 0) {
      final List<MenuItemModel> updatedList = List.from(state.orderedMenuItems);
      updatedList.removeWhere((item) => item.id == event.itemId);
      emit(state.copyWith(
          orderedMenuItems: updatedList,
          status: OrderAddItemsPageStatus.success));
    } else {
      final List<MenuItemModel> updatedList =
          state.orderedMenuItems.map((item) {
        if (item.id == event.itemId) {
          if (decreasedCount == 0) {
          } else {}
          return item.copyWith(itemCount: decreasedCount);
        } else {
          return item;
        }
      }).toList();
      emit(state.copyWith(
          status: OrderAddItemsPageStatus.success,
          orderedMenuItems: updatedList));
    }
  }
}
