import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEvent>((event, emit) {});
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
    // print('Username: ${event.username} - (_usernameEvent)');
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
    // print('Email: ${event.email} - (_emailEvent)');
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
    // print('Password: ${event.password} - (_passwordEvent)');
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(repassword: event.repassword));
    // print('Repassword: ${event.repassword} - (_repasswordEvent)');
  }
}
