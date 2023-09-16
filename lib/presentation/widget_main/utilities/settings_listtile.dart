import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class List_tile_settings extends StatelessWidget {
  const List_tile_settings({
    Key? key,
    required this.text,
    required this.iconButton,
  }) : super(key: key);

  final String text;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          text,
          style: TextStyle(fontSize: 30, color: fontcolor),
        ),
        trailing: iconButton);
  }
}
