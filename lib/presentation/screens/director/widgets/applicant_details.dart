// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/screens/shortlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicantDetails extends StatelessWidget {
  final String id;
  final String name;
  final String age;
  final List<dynamic> image;
  final String height;
  final String weight;
  final String skill;
  final String experience;
  final String about;
  final String qualification;
  final String currentjob;
  final String userId;

  ApplicantDetails({
    super.key,
    required this.id,
    required this.name,
    required this.weight,
    required this.image,
    required this.height,
    required this.age,
    required this.skill,
    required this.experience,
    required this.about,
    required this.qualification,
    required this.currentjob,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              kheight25,
              Center(
                child: Text(
                  "Applicant Details",
                  style: TextStyle(
                    color: fontcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              kheight25,
              Container(
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.cover,
                )),
              ),
              kheight25,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Age: $age",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Height: $height",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Weight: $weight",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "skills: $skill",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Experience: $experience",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "About: $about",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Qualification: $qualification",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Current Job: $currentjob",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ShortlistScreen(
                                    userId: userId,
                                    name: name,
                                  )));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(white),
                    ),
                    child: Text(
                      "Shortlist",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      reject(id, context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(white),
                    ),
                    child: Text(
                      "Reject",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
