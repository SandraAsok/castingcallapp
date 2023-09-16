import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/model/applied/applied_screen.dart';
import 'package:castingcallapp/presentation/screens/model/home/home_screen.dart';
import 'package:castingcallapp/presentation/screens/model/notify/notify_screen.dart';
import 'package:castingcallapp/presentation/screens/model/roles/roles_screen.dart';
import 'package:castingcallapp/presentation/widget_main/bottomnav_widget.dart';
import 'package:flutter/material.dart';

class ModelMainPage extends StatelessWidget {
  ModelMainPage({super.key});

  final _pages = [
    const ModelHome(),
    const RoleScreen(),
    AppliedScreen(),
    NotifyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: ((context, int index, _) {
          return _pages[index];
        }),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
