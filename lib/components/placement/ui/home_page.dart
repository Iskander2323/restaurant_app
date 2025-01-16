import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/placement/bloc/placement_bloc.dart';
import 'package:restaurant_app/components/placement/ui/placements_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body:
          BlocBuilder<PlacementBloc, PlacementState>(builder: (context, state) {
        switch (state.status) {
          case PlacementStateStatus.initial:
            return Center(child: CircularProgressIndicator());
          case PlacementStateStatus.failure:
            return Center(
              child: Text('ERROR'),
            );
          case PlacementStateStatus.success:
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: PlacementsGridView(placements: state.placements),
            );
        }
      }),
    );
  }
}
