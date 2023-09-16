import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class AddJobTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  // ignore: prefer_const_constructors_in_immutables
  AddJobTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: white,
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: white, fontSize: 20),
      ),
      style: TextStyle(color: white, fontSize: 20),
    );
  }
}
