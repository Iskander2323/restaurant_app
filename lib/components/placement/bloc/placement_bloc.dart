import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/components/placement/model/placement_model.dart';
import 'package:restaurant_app/components/placement/repository/placement_repository.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  final PlacementRepository _placementRepository;
  PlacementBloc({required PlacementRepository placementRepository})
      : _placementRepository = placementRepository,
        super(PlacementState()) {
    on<FetchPlacementsEvents>(_fetchPlacement);
  }

  Future<void> _fetchPlacement(
      FetchPlacementsEvents event, Emitter<PlacementState> emit) async {
    await _placementRepository.addPlacements();
    try {
      final placements = await _placementRepository.fetchPlacements();
      emit(state.copyWith(
          placements: placements, status: PlacementStateStatus.success));
    } on Exception catch (e) {
      log(e.toString(), name: 'PLACEMENT BLOC');
    }
  }
}
