import 'package:flutter/material.dart';
import 'package:restaurant_app/components/placement/model/placement_model.dart';
import 'package:restaurant_app/components/placement/ui/placement_card.dart';

class PlacementsGridView extends StatelessWidget {
  const PlacementsGridView({super.key, required this.placements});

  final List<PlacementModel> placements;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 1,
      ),
      itemBuilder: (context, index) {
        return PlacementCard(placement: placements[index]);
      },
      itemCount: placements.length,
    );
  }
}
