import 'package:flutter/material.dart';
import 'package:restaurant_app/components/order_list/model/order_model.dart';
import 'package:restaurant_app/components/order_list/ui/order_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: OrderItem(
          order: orders[index],
        ),
      ),
      itemCount: orders.length,
    );
  }
}
