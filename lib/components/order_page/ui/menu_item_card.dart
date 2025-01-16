import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order_list/model/menu_item_model.dart';
import 'package:restaurant_app/components/order_list/ui/order_item.dart';
import 'package:restaurant_app/components/order_page/bloc/order_page_bloc.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.menuItem});
  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<OrderPageBloc>()
          .add(AddMenuItemToOrderListEvent(menuItem: menuItem)),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Text(
                  '${menuItem.itemPrice}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text('${menuItem.itemName}')
          ],
        ),
      ),
    );
  }
}
