part of 'order_page_bloc.dart';

sealed class OrderPageEvent extends Equatable {
  const OrderPageEvent();

  @override
  List<Object> get props => [];
}

final class FetchMenuItemsEvent extends OrderPageEvent {}

final class IncreaseItemCountEvent extends OrderPageEvent {
  final int itemId;
  final int actualCount;
  const IncreaseItemCountEvent(
      {required this.itemId, required this.actualCount});
}

final class DecreaseItemCountEvent extends OrderPageEvent {
  final int itemId;
  final int actualCount;
  const DecreaseItemCountEvent(
      {required this.itemId, required this.actualCount});
}

final class AddMenuItemToOrderListEvent extends OrderPageEvent {
  final MenuItemModel menuItem;

  const AddMenuItemToOrderListEvent({required this.menuItem});
}

final class ClearStateEvent extends OrderPageEvent {}
