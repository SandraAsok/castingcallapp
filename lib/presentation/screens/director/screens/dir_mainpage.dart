import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/utility/home_appbar.dart';
import 'package:castingcallapp/presentation/screens/director/utility/home_drawer.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/jobpost_tile.dart';

import 'package:flutter/material.dart';

class DirMainPage extends StatelessWidget {
  const DirMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        drawer: const HomeDrawer(),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: HomeAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // kheight,
              //const SearchWidget(),
              kheight,
              JobPostTile(),
            ],
          ),
        ),
      ),
    );
  }
}
