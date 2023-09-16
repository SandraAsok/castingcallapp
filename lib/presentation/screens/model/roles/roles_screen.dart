import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/action.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/cameo.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/character.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/child_acting.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/comedy.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/lead.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/mentor.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/other.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/romantic_lead.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/seducress.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/side_kick.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/support.dart';
import 'package:castingcallapp/presentation/screens/model/roles/subscreens/villain.dart';
import 'package:castingcallapp/presentation/widget_main/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Appbarwidget(title: "Choose the Area"),
        ),
        body: SingleChildScrollView(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            children: [
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => LeadScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.person_alt,
                      text: 'Lead',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SupportScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.person_2_alt,
                      text: 'Support',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ComedyScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.smiley_fill,
                      text: 'Comedy',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => VillainScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.heart_slash_fill,
                      text: 'Villain',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => RomeoScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.guitars,
                      text: 'Romeo',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ActionScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.hammer_fill,
                      text: 'Action',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SideKickScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon:
                          CupertinoIcons.arrow_down_right_arrow_up_left,
                      text: 'Side Kick',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => MentorScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.heart_circle,
                      text: 'Mentor',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SeductressScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.heart_slash_circle_fill,
                      text: 'Seductress',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => CharacterScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.person,
                      text: 'Character',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => CameoScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.person_badge_plus_fill,
                      text: 'Cameo',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ChildrenScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.person_crop_circle_fill,
                      text: 'Children',
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Material(
                  color: white,
                  child: InkWell(
                    splashColor: black,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => OtherScreen(),
                      ));
                    },
                    child: const InkwellSizedBox(
                      cupertinoicon: CupertinoIcons.group_solid,
                      text: 'Others',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InkwellSizedBox extends StatelessWidget {
  final IconData cupertinoicon;
  final String text;

  const InkwellSizedBox({super.key, required this.cupertinoicon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            cupertinoicon,
            size: 60.0,
            color: Colors.black,
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
