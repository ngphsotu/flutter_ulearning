part of 'welcome_bloc.dart';

class WelcomeState {
  int page;

  WelcomeState({required this.page});
}

class WelcomeInitial extends WelcomeState {
  WelcomeInitial({super.page = 0});
}
