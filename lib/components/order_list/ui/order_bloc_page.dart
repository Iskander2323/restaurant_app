import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order_list/bloc/order_bloc.dart';
import 'package:restaurant_app/components/order_list/ui/order_page.dart';

class OrderBlocPage extends StatelessWidget {
  const OrderBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderBloc>(context)..add(FetchOrdersEvent()),
      child: OrderPage(),
    );
  }
}
