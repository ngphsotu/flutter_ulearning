import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeDots>(_homeDots);
  }

  void _homeDots(HomeDots event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
    if (kDebugMode) {
      print('Index: ${event.index}');
    }
  }
}
