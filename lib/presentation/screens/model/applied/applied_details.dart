import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/jobdescriptionfield.dart';
import 'package:flutter/material.dart';

class AppliedPostDetails extends StatefulWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;
  final String userId;

  const AppliedPostDetails({
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
    required this.userId,
  }) : super(key: key);

  @override
  _AppliedPostDetailsState createState() => _AppliedPostDetailsState();
}

class _AppliedPostDetailsState extends State<AppliedPostDetails> {
  bool isSaved = false;

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
                      decoration: BoxDecoration(
                        border: Border.all(color: white),
                      ),
                      child: Center(
                        child: Text(
                          widget.jobtitle,
                          style: TextStyle(
                            color: fontcolor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    kheight,
                    JobDescriptionField(field: "Role : ${widget.role}"),
                    kheight,
                    JobDescriptionField(field: "Skill : ${widget.skill}"),
                    kheight,
                    JobDescriptionField(field: "Category : ${widget.category}"),
                    kheight,
                    JobDescriptionField(field: "Required Age : ${widget.age}"),
                    kheight,
                    JobDescriptionField(
                      field: "Contact : ${widget.contact}",
                    ),
                    kheight,
                    JobDescriptionField(
                      field: "Apply On or Before: ${widget.deadline}",
                    ),
                    kheight,
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
