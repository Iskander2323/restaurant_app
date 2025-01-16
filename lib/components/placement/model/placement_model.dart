import 'package:equatable/equatable.dart';

import '../../local_db/local_db.dart';

class PlacementModel extends Equatable {
  const PlacementModel({required this.id, required this.placementName});

  final int id;
  final String placementName;

  PlacementModel.fromLocal(Placement data)
      : id = data.id,
        placementName = data.title;

  @override
  List<Object?> get props => [id, placementName];
}
