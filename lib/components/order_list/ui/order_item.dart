import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/order_list/bloc/order_bloc.dart';
import 'package:restaurant_app/components/order_list/model/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('OrdersAddItemPage'),
      child: Container(
        decoration: BoxDecoration(
            color: order.isPaid ? Colors.green : Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Заказ ${order.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Text(
              '${order.sum} тг',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            IconButton(
                onPressed: () {
                  context.read<OrderBloc>().add(ChangeOrderStatusEvent(
                      orderId: order.id, isPaid: !order.isPaid));
                },
                icon: Icon(Icons.paid))
          ],
        ),
      ),
    );
  }
}
