import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/components/bloc/placement_bloc.dart';
import 'package:restaurant_app/components/ui/home_page.dart';

class HomeBlocPage extends StatelessWidget {
  const HomeBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PlacementBloc>(context),
      child: HomePage(),
    );
  }
}
