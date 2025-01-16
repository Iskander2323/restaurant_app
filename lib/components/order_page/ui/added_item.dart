import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order_list/model/menu_item_model.dart';
import 'package:restaurant_app/components/order_list/ui/order_item.dart';
import 'package:restaurant_app/components/order_page/bloc/order_page_bloc.dart';

class AddedItemCard extends StatefulWidget {
  final MenuItemModel menuItem;

  const AddedItemCard({super.key, required this.menuItem});

  @override
  _AddedItemCardState createState() => _AddedItemCardState();
}

class _AddedItemCardState extends State<AddedItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.menuItem.itemName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    context.read<OrderPageBloc>().add(DecreaseItemCountEvent(
                        itemId: widget.menuItem.id,
                        actualCount: widget.menuItem.itemCount));
                  },
                ),
                Text(
                  '${widget.menuItem.itemCount}', // Количество
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    context.read<OrderPageBloc>().add(IncreaseItemCountEvent(
                        itemId: widget.menuItem.id,
                        actualCount: widget.menuItem.itemCount));
                  },
                ),
              ],
            ),
            // Цена за 1 элемент
            Text(
              '${widget.menuItem.itemPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
