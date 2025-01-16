import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/bloc/placement_bloc.dart';
import 'package:restaurant_app/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [BlocProvider(create: (context) => PlacementBloc())],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
        ));
  }
}
