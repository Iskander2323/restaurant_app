import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/home.dart';
import 'package:restaurant_app/components/order/ui/order_bloc_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => HomeBlocPage(), routes: [
    GoRoute(
      path: 'orders',
      name: 'OrdersPage',
      builder: (context, state) => OrderBlocPage(),
    )
  ]),
]);
