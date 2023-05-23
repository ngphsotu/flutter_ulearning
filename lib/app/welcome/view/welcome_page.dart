// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';
import '/app/welcome/welcome.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      print('Index value is $index');
                    },
                    children: [
                      buildWelcomePage(
                        1,
                        context,
                        'First see learning',
                        'Forget about a for of paper all knowledge in one learning!',
                        'assets/images/reading.png',
                        'Next',
                      ),
                      buildWelcomePage(
                        2,
                        context,
                        'Connect With Everyone',
                        'Always keep in touch with your tutor & friend. Let\'s get connected!',
                        'assets/images/boy.png',
                        'Next',
                      ),
                      buildWelcomePage(
                        3,
                        context,
                        'Always Fascinated Learning',
                        'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                        'assets/images/man.png',
                        'Get Started',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: buildDots(state),
                    // buildSmoothPageIndicator(state),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
