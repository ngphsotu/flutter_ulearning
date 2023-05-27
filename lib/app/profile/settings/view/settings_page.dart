import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/global.dart';
import '../settings.dart';
import '/common/common.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print('Tapped Logout');
                      }
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const ReusableText(text: 'Confirm logout'),
                            content: const ReusableText(text: 'Are you sure ?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if (kDebugMode) {
                                    print('Pressed Cancel Logout Text Button');
                                  }
                                },
                                child: const ReusableText(text: 'Cancel'),
                              ),
                              TextButton(
                                onPressed: _removeUserData,
                                child: const ReusableText(text: 'Confirm'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 100.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/icons/logout.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _removeUserData() {
    final navigator = Navigator.of(context);
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    navigator.pushNamedAndRemoveUntil('/signInPage', (route) => false);
    if (kDebugMode) {
      print('Pressed Confirm Logout Text Button');
    }
  }
}
