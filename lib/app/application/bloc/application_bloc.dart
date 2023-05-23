// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    // on<HomeEvent>((event, emit) {});
    on<TriggerApplicationEvent>((event, emit) {
      emit(ApplicationState(index: state.index));
      print('My tapped index: ${event.index}');
    });
  }
}
