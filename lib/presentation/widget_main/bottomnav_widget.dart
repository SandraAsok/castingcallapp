import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: ((context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: ((index) {
            indexChangeNotifier.value = index;
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: appcolor,
          selectedItemColor: white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: appiconcolor,
                size: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: appiconcolor,
                size: 20,
              ),
              label: 'Roles',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist_rounded,
                color: appiconcolor,
                size: 20,
              ),
              label: 'Applied',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: appiconcolor,
                size: 20,
              ),
              label: 'Notify',
            ),
          ],
        );
      }),
    );
  }
}
