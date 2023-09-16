// ignore_for_file: file_names

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotifyContainer extends StatelessWidget {
  NotifyContainer(
    String message, {
    Key? key,
  }) : super(key: key);
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: boxdecoration,
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: appbarfontcolor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
