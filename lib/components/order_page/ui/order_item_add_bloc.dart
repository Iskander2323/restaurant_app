import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order_page/bloc/order_page_bloc.dart';
import 'package:restaurant_app/components/order_page/ui/order_item_add_page.dart';

class OrderItemAddBloc extends StatelessWidget {
  const OrderItemAddBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderPageBloc>(context)
        ..add(FetchMenuItemsEvent()),
      child: OrderItemAddPage(),
    );
  }
}
