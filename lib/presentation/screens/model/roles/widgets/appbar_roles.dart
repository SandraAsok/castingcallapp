import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class RolesAppBar extends StatelessWidget {
  final String title;
  const RolesAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      title: Center(
          child: Text(
        "$title Roles",
        style: const TextStyle(fontSize: 30),
      )),
    );
  }
}
