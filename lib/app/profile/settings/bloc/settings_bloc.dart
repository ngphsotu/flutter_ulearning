import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(event, emit) {
    emit(SettingsInitial);
  }
}
