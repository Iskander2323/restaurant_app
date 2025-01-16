import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/home.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeBlocPage(),
  ),
]);
