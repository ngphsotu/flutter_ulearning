part of 'home_bloc.dart';

class HomeEvent {
  const HomeEvent();
}

class HomeDots extends HomeEvent {
  final int index;

  HomeDots(this.index);
}
