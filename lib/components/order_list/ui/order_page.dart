import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/order_list/bloc/order_bloc.dart';
import 'package:restaurant_app/components/order_list/ui/order_list_view.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 400,
              child:
                  BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
                switch (state.status) {
                  case OrderStateStatus.initial:
                    return Center(child: CircularProgressIndicator());
                  case OrderStateStatus.failure:
                    return Center(
                      child: Text('ERROR'),
                    );
                  case OrderStateStatus.success:
                    return OrderListView(orders: state.orders);
                }
              }),
            ),
            GestureDetector(
              onTap: () => context.goNamed('OrdersAddItemPage'),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'ADD ORDER',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
