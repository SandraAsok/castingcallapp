import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/domain/savemodel.dart';
import 'package:castingcallapp/presentation/screens/model/applied/application_form.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/jobdescriptionfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyDetails extends StatefulWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;

  const ApplyDetails({
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
  _ApplyDetailsState createState() => _ApplyDetailsState();
}

class _ApplyDetailsState extends State<ApplyDetails> {
  late SharedPreferences _preferences;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _loadSavedState();
  }

  Future<void> _loadSavedState() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      isSaved = _preferences.getBool(widget.id) ?? false;
    });
  }

  Future<void> _savePost() async {
    setState(() {
      isSaved = true;
    });

    _preferences.setBool(widget.id, true);

    // Perform additional save logic here if needed
    addSaved(
      Saved(
        jobtitle: widget.jobtitle,
        role: widget.role,
        category: widget.category,
        age: widget.age,
        skill: widget.skill,
        contact: widget.contact,
        deadline: widget.deadline,
        imageList: widget.image,
      ),
      context,
    );
  }

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
                  "Details Here",
                  style: TextStyle(
                    color: fontcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
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
                    Text(
                      widget.jobtitle,
                      style: TextStyle(
                        color: fontcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight,
                    JobDescriptionField(field: "Role : ${widget.role}"),
                    JobDescriptionField(field: "Skill : ${widget.skill}"),
                    JobDescriptionField(field: "Category : ${widget.category}"),
                    JobDescriptionField(field: "Required Age : ${widget.age}"),
                    JobDescriptionField(
                      field: "Contact : ${widget.contact}",
                    ),
                    JobDescriptionField(
                      field: "Apply On or Before : ${widget.deadline}",
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: kwidth / 2,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: black),
                          ),
                          child: TextButton(
                            onPressed: isSaved ? null : _savePost,
                            child: Text(
                              isSaved ? "Saved" : "Save",
                              style: TextStyle(
                                color: black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: kwidth / 2.4,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: black),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
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
                                          )));
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
