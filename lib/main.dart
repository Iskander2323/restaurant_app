import 'package:flutter/material.dart';
import 'package:restaurant_app/app.dart';
import 'package:restaurant_app/components/order_list/repository/order_repository.dart';
import 'package:restaurant_app/components/placement/repository/placement_repository.dart';

void main() async {
  final PlacementRepository placementRepository = PlacementRepository();
  final OrderRepository orderRepository = OrderRepository();
  runApp(App(
    placementRepository: placementRepository,
    orderRepository: orderRepository,
  ));
}
