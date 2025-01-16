import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/order_list/bloc/order_bloc.dart';
import 'package:restaurant_app/components/order_list/repository/order_repository.dart';
import 'package:restaurant_app/components/order_page/bloc/order_page_bloc.dart';
import 'package:restaurant_app/components/placement/bloc/placement_bloc.dart';
import 'package:restaurant_app/components/placement/repository/placement_repository.dart';
import 'package:restaurant_app/routes.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.placementRepository,
      required this.orderRepository});

  final PlacementRepository placementRepository;
  final OrderRepository orderRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PlacementBloc(placementRepository: placementRepository)),
          BlocProvider(create: (context) => OrderPageBloc()),
          BlocProvider(
              create: (context) => OrderBloc(orderRepository: orderRepository)),
          RepositoryProvider.value(value: placementRepository),
          RepositoryProvider.value(value: orderRepository)
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
        ));
  }
}
