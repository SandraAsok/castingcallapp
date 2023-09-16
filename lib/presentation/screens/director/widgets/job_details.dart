// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/screens/view_applicants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;
  JobDetails({
    super.key,
    required this.id,
    required this.jobtitle,
    required this.role,
    required this.image,
    required this.category,
    required this.age,
    required this.skill,
    required this.contact,
    required this.deadline,
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
                  role,
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
                      jobtitle,
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Role: $role",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Skill: $skill",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Category: $category",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Required Age: $age",
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Contact Us Via email: $contact",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    Text(
                      "Apply On or Before: $deadline",
                      style: TextStyle(
                        color: fontcolor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ViewApplicantsScreen(
                          jobtitle: jobtitle,
                        ),
                      ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(white),
                ),
                child: Text(
                  "View Applicants",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
