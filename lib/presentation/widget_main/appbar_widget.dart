import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class Appbarwidget extends StatelessWidget {
  final String title;
  const Appbarwidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      title: Center(
          child: Text(
        title,
        style: const TextStyle(fontSize: 30),
      )),
    );
  }
}
