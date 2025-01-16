import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/placement/bloc/placement_bloc.dart';
import 'package:restaurant_app/components/placement/repository/placement_repository.dart';
import 'package:restaurant_app/routes.dart';

class App extends StatelessWidget {
  const App({super.key, required this.placementRepository});

  final PlacementRepository placementRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PlacementBloc(placementRepository: placementRepository)),
          RepositoryProvider.value(value: placementRepository)
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
        ));
  }
}
