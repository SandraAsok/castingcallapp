import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/jobdescriptionfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../applied/application_form.dart';

class SavedDetails extends StatefulWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;

  const SavedDetails({
    Key? key,
    required this.id,
    required this.jobtitle,
    required this.role,
    required this.image,
    required this.category,
    required this.age,
    required this.skill,
    required this.contact,
    required this.deadline,
  }) : super(key: key);

  @override
  _SavedDetailsState createState() => _SavedDetailsState();
}

class _SavedDetailsState extends State<SavedDetails> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              kheight25,
              Center(
                child: Text(
                  widget.role,
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
                    image: NetworkImage(widget.image[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              kheight25,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      decoration:
                          BoxDecoration(border: Border.all(color: white)),
                      child: Text(
                        widget.jobtitle,
                        style: TextStyle(
                          color: fontcolor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    kheight,
                    JobDescriptionField(field: "Role: ${widget.role}"),
                    kheight,
                    JobDescriptionField(field: "Skill: ${widget.skill}"),
                    kheight,
                    JobDescriptionField(field: "Category: ${widget.category}"),
                    kheight,
                    JobDescriptionField(field: "Required Age: ${widget.age}"),
                    kheight,
                    JobDescriptionField(
                      field: "Contact : ${widget.contact}",
                    ),
                    kheight,
                    JobDescriptionField(
                      field: "Apply On or Before: ${widget.deadline}",
                    ),
                    kheight,
                    Container(
                      height: 50,
                      width: kwidth / 2.4,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: black),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => ApplicationForm(
                                id: widget.id,
                                jobtitle: widget.jobtitle,
                                role: widget.role,
                                image: widget.image,
                                category: widget.category,
                                age: widget.age,
                                skill: widget.skill,
                                contact: widget.contact,
                                deadline: widget.deadline,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Apply Now",
                          style: TextStyle(
                            color: black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
