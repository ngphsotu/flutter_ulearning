// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signin.dart';
import '/common/common.dart';

Column formSignIn(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildThirdPartyLogin(context),
      Center(
        child: reusableText('Or use your email account to login'),
      ),
      Container(
        margin: EdgeInsets.only(top: 25.h),
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ReusableTextFormField(
              hintText: 'Enter your email',
              labelText: 'Email',
              prefixIcon: const Icon(Icons.person, color: Colors.black),
              autocorrect: false,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context.read<SignInBloc>().add(EmailEvent(email: value));
              },
            ),
            SizedBox(height: 20.h),
            ReusableTextFormField(
              hintText: 'Enter your password',
              labelText: 'Password',
              prefixIcon: const Icon(Icons.security, color: Colors.black),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context.read<SignInBloc>().add(PasswordEvent(password: value));
              },
            ),
            SizedBox(height: 10.h),
            forgotPassword(),
            Container(
              width: 325.w,
              height: 40.h,
              margin: EdgeInsets.only(left: 75.w, right: 75.w, top: 125.h),
              child: ReusableButton(
                buttonName: 'Login',
                backgroundColor: AppColors.primaryElement,
                onPressed: () {
                  print('Press Login Button');
                  SignInController(context: context).handleEmailSignIn('email');
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/homePage', (route) => false);
                },
              ),
            ),
            Center(child: reusableText('or')),
            Container(
              width: 325.w,
              height: 40.h,
              margin: EdgeInsets.only(left: 75.w, right: 75.w),
              child: ReusableButton(
                side: const BorderSide(
                  color: AppColors.primaryThirdElementText,
                ),
                textColor: AppColors.primaryText,
                buttonName: 'Sign Up',
                backgroundColor: AppColors.primaryBackground,
                onPressed: () {
                  print('Press Signup Button');
                  Navigator.of(context).pushNamed('/signUp');
                  // SignUpController(context: context).handleEmailSignUp();
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     'signUp', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
