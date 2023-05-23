// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../signup.dart';
import '/common/common.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  // * Handle Email SignUp
  Future<void> handleEmailSignUp() async {
    final state = context.read<SignUpBloc>().state;

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;

    if (username.isEmpty) {
      if (kDebugMode) {
        print('Username can not be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Username can not be empty');
      return;
    }

    if (email.isEmpty) {
      if (kDebugMode) {
        print('Email can not be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Email can not be empty');
      return;
    }

    if (password.isEmpty) {
      if (kDebugMode) {
        print('Password can not be empty - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Password can not be empty');
      return;
    }

    if (repassword.isEmpty) {
      if (kDebugMode) {
        print('Your password confirmation is wrong - (handleEmailSignUp)');
      }
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                'An email has been sent to your registered email. To active it, please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak - (handleEmailSignUp)');
        }
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The email is already in use - (handleEmailSignUp)');
        }
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        if (kDebugMode) {
          print('Your email id is invalid - (handleEmailSignUp)');
        }
        toastInfo(msg: 'Your email id is invalid');
      }
    }
  }
}
