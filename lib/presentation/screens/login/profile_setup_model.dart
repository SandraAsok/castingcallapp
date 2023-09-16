import 'dart:developer';

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/domain/userprofile.dart';
import 'package:castingcallapp/presentation/screens/model/modelmainpage.dart';
import 'package:castingcallapp/presentation/widget_main/appbar_widget.dart';
import 'package:castingcallapp/presentation/widget_main/utilities/useravatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSetupModel extends StatelessWidget {
  ProfileSetupModel({super.key});

  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final interestcontroller = TextEditingController();
  final biocontroller = TextEditingController();
  final experiencecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Appbarwidget(title: "Build Your Profile")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UserAvatar(icon: Icons.photo_camera_rounded),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: namecontroller,
                        cursorColor: black,
                        autofocus: true,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "UserName *",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      TextField(
                        controller: agecontroller,
                        cursorColor: black,
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Age *",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: interestcontroller,
                        cursorColor: black,
                        autofocus: true,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Interest *",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: biocontroller,
                        cursorColor: black,
                        autofocus: true,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Bio *",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      TextField(
                        controller: experiencecontroller,
                        cursorColor: black,
                        autofocus: true,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Experience *",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: black),
                  child: TextButton(
                    onPressed: () {
                      log(imageUrl);
                      log(namecontroller.text);
                      log(agecontroller.text);
                      log(interestcontroller.text);
                      log(biocontroller.text);
                      log(experiencecontroller.text);

                      createUserProfile(
                        image: imageUrl,
                        name: namecontroller.text,
                        age: agecontroller.text,
                        interest: interestcontroller.text,
                        bio: biocontroller.text,
                        experience: experiencecontroller.text,
                        context: context,
                      );

                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: ((context) => ModelMainPage()),
                            fullscreenDialog: true,
                          ));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20, color: white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUserProfile(
      {required String image,
      required String name,
      required String age,
      required String interest,
      required String bio,
      required String experience,
      required context}) async {
    final docUserProfile = FirebaseFirestore.instance.collection('users').doc();
    if (imageUrl == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please upload an image")));
      return;
    }
    final user = UserProfile(
      id: FirebaseAuth.instance.currentUser!.uid,
      image: imageUrl,
      userName: namecontroller.text,
      age: agecontroller.text,
      interest: interestcontroller.text,
      bio: biocontroller.text,
      experience: experiencecontroller.text,
    );
    final json = user.toJson();
    await docUserProfile.set(json);
  }
}
