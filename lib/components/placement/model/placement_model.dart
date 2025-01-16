import 'package:equatable/equatable.dart';

class PlacementModel extends Equatable {
  const PlacementModel({required this.id, required this.placementName});

  final int id;
  final String placementName;

  @override
  List<Object?> get props => [id, placementName];
}
