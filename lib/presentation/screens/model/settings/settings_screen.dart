import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/login/signin_screen.dart';
import 'package:castingcallapp/presentation/widget_main/popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: black,
          title: Text(
            "Settings",
            style: TextStyle(
                color: fontcolor, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              kheight,
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: white,
                  size: 30,
                ),
                title: Text(
                  'About',
                  style: TextStyle(color: white, fontSize: 22),
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
                  size: 30,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(color: white, fontSize: 22),
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
                  size: 30,
                ),
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(color: white, fontSize: 22),
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
                  style: TextStyle(color: fontcolor, fontSize: 20),
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
                  size: 30,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: white, fontSize: 22),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SignInScreen())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
