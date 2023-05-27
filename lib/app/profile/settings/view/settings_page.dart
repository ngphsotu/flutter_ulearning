import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning/app/application/application.dart';

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
                  settingsButton(context, _removeUserData),
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
    context
        .read<ApplicationBloc>()
        .add(const TriggerApplicationEvent(index: 0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    navigator.pushNamedAndRemoveUntil('/signInPage', (route) => false);
    if (kDebugMode) {
      print('Pressed Confirm Logout Text Button');
    }
  }
}
