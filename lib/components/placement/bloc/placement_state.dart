part of 'placement_bloc.dart';

enum PlacementStateStatus { initial, failure, success }

final class PlacementState extends Equatable {
  const PlacementState(
      {this.status = PlacementStateStatus.initial,
      this.placements = const <PlacementModel>[]});

  PlacementState copyWith({
    List<PlacementModel>? placements,
    PlacementStateStatus? status,
  }) {
    return PlacementState(
        placements: placements ?? this.placements,
        status: status ?? this.status);
  }

  final List<PlacementModel> placements;
  final PlacementStateStatus status;
  @override
  List<Object> get props => [placements, status];
}
