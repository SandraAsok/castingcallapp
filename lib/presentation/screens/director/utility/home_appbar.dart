import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/director/screens/dir_search_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      title: Center(
        child: Text(
          "Create Opportunities",
          style: TextStyle(
            fontSize: 25,
            color: appbarfontcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
        top: Radius.circular(25),
      )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const DirSearchScreen();
                },
              ));
            },
            icon: Icon(
              Icons.search,
              color: appbarIconColor,
              size: 25,
            ))
      ],
    );
  }
}
