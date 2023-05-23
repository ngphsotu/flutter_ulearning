part of 'application_bloc.dart';

abstract class ApplicationEvent {
  const ApplicationEvent();
}

class TriggerApplicationEvent extends ApplicationEvent {
  final int index;

  const TriggerApplicationEvent({required this.index}) : super();
}
