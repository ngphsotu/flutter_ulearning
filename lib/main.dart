import 'package:flutter/material.dart';

import 'my_app.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}
