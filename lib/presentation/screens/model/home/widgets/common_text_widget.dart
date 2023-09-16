import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class CommonButtonText extends StatelessWidget {
  final String text;
  const CommonButtonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          letterSpacing: 2,
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}

class CommonText extends StatelessWidget {
  final String text;
  const CommonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(letterSpacing: 2, fontSize: 22, color: fontcolor),
    );
  }
}
