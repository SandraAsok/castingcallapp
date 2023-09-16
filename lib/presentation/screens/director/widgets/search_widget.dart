import 'dart:developer';

import 'package:castingcallapp/presentation/screens/director/screens/dir_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      itemSize: 25.0,
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Colors.grey.withOpacity(0.4),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
      ),
      style: const TextStyle(color: Colors.black),
      onTap: () {
        log('Search Field');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const DirSearchScreen();
          },
        ));
      },
    );
  }
}
