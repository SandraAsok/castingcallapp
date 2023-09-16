import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

//constant heights and widths
SizedBox kheight = const SizedBox(height: 15);
SizedBox kheight25 = const SizedBox(height: 25);
SizedBox kwidth = const SizedBox(width: 15);
SizedBox kheight80 = const SizedBox(height: 80);

//boxdecoration in appbar
final boxdecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
  color: black,
);

BoxDecoration boxdecorWelcome = BoxDecoration(color: black);

//boxdecoration in appbar
final chatboxdecoration = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ),
  color: black,
);

//boxdecoration in welcome screen
final signinout = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
  color: black,
);

//outerboxdecoration in homescreen
final outerboxdecorhome = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ),
  color: black,
);

//innerboxdecoration in homescreen
const innerboxdecorhome = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(
    "assets/images/pic1.jpeg",
  )),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
    bottomLeft: Radius.circular(60),
    bottomRight: Radius.circular(60),
  ),
  //color: white,
);

//model side role buttons
class InkwellSizedBox extends StatelessWidget {
  final IconData cupertinoicon;
  final String text;
  const InkwellSizedBox({
    Key? key,
    required this.cupertinoicon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: Column(
        children: [
          Icon(
            cupertinoicon,
            size: 40,
          ),
          Text(
            text,
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}
