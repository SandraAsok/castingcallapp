import 'dart:developer';

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/director/screens/dir_mainpage.dart';
import 'package:castingcallapp/presentation/widget_main/appbar_widget.dart';
import 'package:castingcallapp/presentation/widget_main/utilities/directoravatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ProfileSetupDirector extends StatelessWidget {
  ProfileSetupDirector({super.key});

  final namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Appbarwidget(title: "Build Profile")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DirectorAvatar(icon: Icons.camera),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: namecontroller,
                    cursorColor: black,
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "UserName *",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: black),
                  child: TextButton(
                    onPressed: () {
                      log(imageUrl);
                      log(namecontroller.text);
                      createDirectorProfile(
                        image: imageUrl,
                        name: namecontroller.text,
                        context: context,
                      );
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const DirMainPage(),
                            fullscreenDialog: true,
                          ));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20, color: white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createDirectorProfile(
      {required String image, required String name, required context}) async {
    final docDirectorProfile =
        FirebaseFirestore.instance.collection('directors').doc();
    if (imageUrl == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please upload an image")));
      return;
    }
    // final director = DirectorModel(
    //   id:
    //   image: imageUrl,
    //   userName: namecontroller.text,
    // );

    await docDirectorProfile.set({
      'id': FirebaseAuth.instance.currentUser!.uid,
      'image': imageUrl,
      'userName': name,
    }).onError((error, stackTrace) {
      return log('success');
    }).onError((error, stackTrace) {
      return log('error');
    });
  }
}
