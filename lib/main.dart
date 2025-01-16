import 'package:flutter/material.dart';
import 'package:restaurant_app/app.dart';
import 'package:restaurant_app/components/placement/repository/placement_repository.dart';

void main() async {
  final PlacementRepository placementRepository = PlacementRepository();

  runApp(App(
    placementRepository: placementRepository,
  ));
}
