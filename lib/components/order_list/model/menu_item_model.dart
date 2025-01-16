import 'package:equatable/equatable.dart';
import 'package:restaurant_app/components/local_db/local_db.dart';

class MenuItemModel extends Equatable {
  final int id;
  final String itemName;
  final double itemPrice;
  final int itemCount;
  final int orderId;

  const MenuItemModel(
      {required this.id,
      required this.itemName,
      required this.itemPrice,
      required this.itemCount,
      required this.orderId});

  MenuItemModel.fromLocal(MenuItem data)
      : id = data.id,
        itemName = data.itemName,
        itemPrice = data.itemPrice,
        itemCount = data.itemCount,
        orderId = data.orderId;

  MenuItemModel copyWith({
    int? id,
    String? itemName,
    double? itemPrice,
    int? itemCount,
    int? orderId,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemCount: itemCount ?? this.itemCount,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  List<Object?> get props => [id, itemName, itemPrice, itemCount, orderId];
}
