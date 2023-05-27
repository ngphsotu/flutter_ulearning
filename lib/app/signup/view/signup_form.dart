import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signup.dart';
import '/common/common.dart';

Column formSignUp(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 25.h),
      const Center(
          child: ReusableText(text: 'Enter your details below & free sign up')),
      Container(
        margin: EdgeInsets.only(top: 100.h),
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextFormField(
              hintText: 'Enter your username',
              labelText: 'Username',
              prefixIcon: const Icon(Icons.person, color: Colors.black),
              autocorrect: false,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context.read<SignUpBloc>().add(UsernameEvent(username: value));
              },
            ),
            SizedBox(height: 25.h),
            ReusableTextFormField(
              hintText: 'Enter your email',
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email, color: Colors.black),
              autocorrect: false,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context.read<SignUpBloc>().add(EmailEvent(email: value));
              },
            ),
            SizedBox(height: 25.h),
            ReusableTextFormField(
              hintText: 'Enter your password',
              labelText: 'Password',
              prefixIcon: const Icon(Icons.security, color: Colors.black),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context.read<SignUpBloc>().add(PasswordEvent(password: value));
              },
            ),
            SizedBox(height: 25.h),
            ReusableTextFormField(
              hintText: 'Re-enter your password to confirm',
              labelText: 'Confirm Password',
              prefixIcon: const Icon(Icons.security, color: Colors.black),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                context
                    .read<SignUpBloc>()
                    .add(RePasswordEvent(repassword: value));
              },
            ),
            SizedBox(height: 25.h),
            const ReusableText(
              text:
                  'By creating an account you have to agree with out them & condication.',
              fontSize: 13,
              maxLines: 2,
            ),
            Container(
              width: 325.w,
              height: 40.h,
              margin: EdgeInsets.only(left: 75.w, right: 75.w, top: 100.h),
              child: ReusableButton(
                buttonName: 'Signup',
                backgroundColor: AppColors.primaryElement,
                onPressed: () {
                  if (kDebugMode) {
                    print('Press Signup Button');
                  }
                  SignUpController(context: context).handleEmailSignUp();
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
