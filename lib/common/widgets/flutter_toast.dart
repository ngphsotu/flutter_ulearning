import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

toastInfo({
  required String msg,
  Color textColor = Colors.white,
  Color backgroundColor = Colors.black,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.TOP,
    fontSize: 16.sp,
    textColor: textColor,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor,
    timeInSecForIosWeb: 2,
  );
}
