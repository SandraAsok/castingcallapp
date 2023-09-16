import 'dart:developer';

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/model/saved/saved_screen.dart';
import 'package:castingcallapp/presentation/screens/model/search/model_search_screen.dart';
import 'package:castingcallapp/presentation/screens/model/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ModelHomeAppBar extends StatelessWidget {
  const ModelHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      leading: IconButton(
        icon: Icon(
          Icons.search,
          color: appbarIconColor,
          size: 25,
        ),
        onPressed: () {
          log('Search Field');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ModelSearchScreen();
            },
          ));
        },
      ),
      title: Center(
          child: Text(
        'Cinema Gate',
        style: TextStyle(fontSize: 30),
      )),
      actions: [
        IconButton(
          icon: Icon(
            Icons.bookmark,
            color: appbarIconColor,
            size: 25,
          ),
          onPressed: () {
            log('Saved');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SavedScreen();
              },
            ));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: appbarIconColor,
            size: 25,
          ),
          onPressed: () {
            log('Settings');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const SettingsScreen();
              },
            ));
          },
        )
      ],
    );
  }
}
