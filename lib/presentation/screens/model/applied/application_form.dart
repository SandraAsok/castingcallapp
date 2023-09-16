import 'dart:developer';
import 'dart:io';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/domain/appliedmodel.dart';
import 'package:castingcallapp/domain/appliedpost.dart';
import 'package:castingcallapp/presentation/screens/director/utility/job_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ApplicationForm extends StatefulWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;
  const ApplicationForm({
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
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController heightcontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();
  final TextEditingController qualificationcontroller = TextEditingController();
  final TextEditingController currentjobcontroller = TextEditingController();
  final TextEditingController skillcontroller = TextEditingController();
  final TextEditingController experiencecontroller = TextEditingController();
  final TextEditingController aboutcontroller = TextEditingController();
  List<String> imageList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: appcolor,
          title: Text(
            "Application Form",
            style: TextStyle(fontSize: 25, color: fontcolor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile == null) {
                      return;
                    } else {
                      File file = File(pickedFile.path);
                      imageList = await _uploadImage(file, namecontroller.text);
                      log(imageList[0]);
                      setState(() {});
                    }
                  },
                  child: SizedBox(
                      height: size.height * 0.4,
                      width: size.width * 0.6,
                      child: imageList.isEmpty
                          ? Container(
                              height: size.height * 0.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                color: black,
                              ),
                              child: Center(
                                child: Text(
                                  "Pick Photos",
                                  style: TextStyle(
                                    color: fontcolor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          : Image.network(imageList[0])),
                ),
              ),
              kheight,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AddJobTextField(
                      controller: namecontroller,
                      hintText: "Enter in this format Name",
                    ),
                    AddJobTextField(
                      controller: agecontroller,
                      hintText: "Enter Your Age:",
                    ),
                    AddJobTextField(
                      controller: heightcontroller,
                      hintText: "Enter Your Height:",
                    ),
                    AddJobTextField(
                      controller: weightcontroller,
                      hintText: "Enter Your Weight:",
                    ),
                    AddJobTextField(
                      controller: qualificationcontroller,
                      hintText: "Enter Your Qualification:",
                    ),
                    AddJobTextField(
                      controller: currentjobcontroller,
                      hintText: "Enter Your Current Job:",
                    ),
                    AddJobTextField(
                      controller: skillcontroller,
                      hintText: "Enter Your skills:",
                    ),
                    AddJobTextField(
                      controller: experiencecontroller,
                      hintText: "Enter Your Experience in film field:",
                    ),
                    AddJobTextField(
                      controller: aboutcontroller,
                      hintText: "Tell Yourself:",
                    ),
                    kheight,
                    TextButton(
                        onPressed: () {
                          addApplied(
                              Applied(
                                jobtitle: widget.jobtitle,
                                name: namecontroller.text,
                                age: agecontroller.text,
                                height: heightcontroller.text,
                                weight: weightcontroller.text,
                                qualification: qualificationcontroller.text,
                                currentjob: currentjobcontroller.text,
                                skill: skillcontroller.text,
                                experience: experiencecontroller.text,
                                about: aboutcontroller.text,
                                imageList: imageList,
                                id: widget.id,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                              ),
                              context);
                          appliedPost(
                              AppliedPost(
                                jobtitle: widget.jobtitle,
                                role: widget.role,
                                category: widget.category,
                                age: widget.age,
                                skill: widget.skill,
                                contact: widget.contact,
                                deadline: widget.deadline,
                                imageList: widget.image,
                                id: widget.id,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                              ),
                              context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: size.width * 0.20,
                                    vertical: 20)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: black),
                            ))),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> _uploadImage(File file, String productName) async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    //int index = imageList.length;

    DateTime now = DateTime.now();
    String timestamp = now.microsecondsSinceEpoch.toString();
    firebase_storage.Reference ref = storage.ref().child('images/$timestamp');

    firebase_storage.UploadTask task = ref.putFile(file);

    await task;
    String downloadURL = await ref.getDownloadURL();
    log(downloadURL);
    imageList.add(downloadURL);
    return imageList;
  }
}
