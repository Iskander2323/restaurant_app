part of 'placement_bloc.dart';

sealed class PlacementState extends Equatable {
  const PlacementState();
  
  @override
  List<Object> get props => [];
}

final class PlacementInitial extends PlacementState {}
