import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signin.dart';
import '/common/common.dart';

class SignInPage extends StatefulWidget implements PreferredSizeWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: buildSignInUpAppBar('Log In'),
              body: SingleChildScrollView(
                child: formSignIn(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
