import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  PlacementBloc() : super(PlacementInitial()) {
    on<PlacementEvent>((event, emit) {});
  }
}
