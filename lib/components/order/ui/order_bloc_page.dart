import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order/bloc/order_bloc.dart';
import 'package:restaurant_app/components/order/ui/order_page.dart';

class OrderBlocPage extends StatelessWidget {
  const OrderBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderBloc>(context),
      child: OrderPage(),
    );
  }
}
