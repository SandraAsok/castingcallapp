import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class JobDescriptionField extends StatelessWidget {
  const JobDescriptionField({
    Key? key,
    required this.field,
  }) : super(key: key);

  final String field;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text(
        field,
        style: TextStyle(
          color: fontcolor,
          fontSize: 20,
        ),
      ),
    );
  }
}
