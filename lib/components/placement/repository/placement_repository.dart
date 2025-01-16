import 'package:restaurant_app/components/local_db/globals.dart';
import 'package:restaurant_app/components/placement/model/placement_model.dart';

class PlacementRepository {
  Future<void> addPlacements() async {
    final List<PlacementModel> placements = [
      PlacementModel(id: 1, placementName: 'Main Hall'),
      PlacementModel(id: 2, placementName: 'Terrace'),
      PlacementModel(id: 3, placementName: 'VIP Room 1'),
      PlacementModel(id: 4, placementName: 'VIP Room 2'),
    ];
    await database.addPlacements(placements);
  }

  Future<List<PlacementModel>> fetchPlacements() async {
    final placements = await database.fetchPlacement();
    return placements;
  }
}
