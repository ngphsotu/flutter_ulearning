part of 'signup_bloc.dart';

class SignUpState {
  final String username;
  final String email;
  final String password;
  final String repassword;

  const SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.repassword = '',
  });

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    String? repassword,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}

class SignUpInitial extends SignUpState {
  SignUpInitial({
    required super.username,
    required super.email,
    required super.password,
    required super.repassword,
  });
}
