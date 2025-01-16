import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/placement/model/placement_model.dart';

class PlacementCard extends StatelessWidget {
  const PlacementCard({super.key, required this.placement});
  final PlacementModel placement;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('OrdersPage'),
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Text(placement.placementName),
      ),
    );
  }
}
