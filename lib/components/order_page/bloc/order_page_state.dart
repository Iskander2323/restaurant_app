part of 'order_page_bloc.dart';

enum OrderAddItemsPageStatus { initial, loading, failure, success }

class OrderPageState extends Equatable {
  const OrderPageState(
      {this.status = OrderAddItemsPageStatus.initial,
      this.menuItems = const <MenuItemModel>[],
      this.orderedMenuItems = const <MenuItemModel>[]});

  OrderPageState copyWith({
    OrderAddItemsPageStatus? status,
    List<MenuItemModel>? menuItems,
    List<MenuItemModel>? orderedMenuItems,
  }) {
    return OrderPageState(
      status: status ?? this.status,
      menuItems: menuItems ?? this.menuItems,
      orderedMenuItems: orderedMenuItems ?? this.orderedMenuItems,
    );
  }

  final List<MenuItemModel> orderedMenuItems;
  final List<MenuItemModel> menuItems;
  final OrderAddItemsPageStatus status;
  @override
  List<Object> get props => [status, menuItems, orderedMenuItems];
}
