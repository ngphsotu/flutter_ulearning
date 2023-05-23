part of 'application_bloc.dart';

class ApplicationState {
  final int index;

  const ApplicationState({this.index = 0});
}

class HomeInitial extends ApplicationState {
  HomeInitial({required super.index});
}
