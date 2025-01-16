import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/placement/bloc/placement_bloc.dart';

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
        return Center(
          child: Text('PLACEMENT PAGE'),
        );
      }),
    );
  }
}
