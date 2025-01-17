import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/home.dart';
import 'package:restaurant_app/components/order_list/ui/order_bloc_page.dart';
import 'package:restaurant_app/components/order_page/ui/order_item_add_bloc.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => HomeBlocPage(), routes: [
    GoRoute(
        path: 'orders',
        name: 'OrdersPage',
        builder: (context, state) => OrderBlocPage(),
        routes: [
          GoRoute(
            path: 'order_page',
            name: 'OrdersAddItemPage',
            builder: (context, state) => OrderItemAddBloc(),
          )
        ])
  ]),
]);
