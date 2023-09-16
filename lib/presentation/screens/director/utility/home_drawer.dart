import 'package:castingcallapp/presentation/screens/director/widgets/add_new_job.dart';
import 'package:castingcallapp/presentation/screens/login/signin_screen.dart';
import 'package:castingcallapp/presentation/widget_main/popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: black,
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(
                Icons.add,
                color: white,
              ),
              title: Text(
                'Add New Job',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const AddNewJob(),
                    ));
              },
            ),
            kheight,
            ListTile(
              leading: Icon(
                Icons.info,
                color: white,
              ),
              title: Text(
                'About',
                style: TextStyle(color: white),
              ),
              onTap: () {
                // Handle drawer item tap
                showAboutDialog(
                  context: context,
                  applicationName: "Cinema Gate",
                  applicationIcon: Image.asset("assets/images/logo.png",
                      height: 32, width: 32),
                  applicationVersion: "1.0.0",
                  children: [
                    const Text(
                      "Cinema Gate is a casting call app which allows individuals to access casting call posts from casting directors.This app contains two sides , Model side as well as Director side",
                    ),
                    kheight,
                    const Text("App developed by Sandra Ashok"),
                  ],
                );
              },
            ),
            kheight,
            ListTile(
              leading: Icon(
                Icons.lock,
                color: white,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (builder) {
                    return Settingmenupopup(mdFilename: 'privacypolicy.md');
                  },
                );
              },
            ),
            kheight,
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: white,
              ),
              title: Text(
                'Terms and Conditions',
                style: TextStyle(color: white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (builder) {
                    return Settingmenupopup(
                        mdFilename: 'termsandconditions.md');
                  },
                );
              },
            ),
            kheight,
            ListTile(
              leading: Icon(
                Icons.share,
                color: white,
                size: 25,
              ),
              title: Text(
                'Share',
                style: TextStyle(color: fontcolor),
              ),
              onTap: () {
                Share.share("https://github.com/SandraAsok",
                    subject: "GitHub Repository of this App");
              },
            ),
            kheight,
            ListTile(
              leading: Icon(
                Icons.logout,
                color: white,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: white),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SignInScreen())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
