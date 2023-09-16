import 'dart:developer';
import 'dart:io';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/domain/postmodel.dart';
import 'package:castingcallapp/presentation/screens/director/utility/job_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddNewJob extends StatefulWidget {
  const AddNewJob({super.key});

  @override
  State<AddNewJob> createState() => _AddNewJobState();
}

class _AddNewJobState extends State<AddNewJob> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController rolecontroller = TextEditingController();
  final TextEditingController categorycontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController skillcontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController deadlinecontroller = TextEditingController();
  List<String> imageList = [];
  String? rolevalue;
  String? categoryvalue;
  String? agevalue;
  List<String> roles = [
    'Lead',
    'Support',
    'Comedy',
    'Villain',
    'Romeo',
    'Action',
    'Side Kick',
    'Mentor',
    'Seductress',
    'Character',
    'Cameo',
    'Children',
    'Others'
  ];

  List<String> category = [
    'Men',
    'Woman',
    'Boy',
    'Girl',
  ];

  List<String> ageLimit = [
    'under 10',
    '10+',
    '15+',
    '20+',
    '25+',
    '30+',
    '40+',
    '50+',
    '60+',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: appcolor,
          title: Text(
            "Add Job Details",
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
                      imageList =
                          await _uploadImage(file, titlecontroller.text);
                      setState(() {});
                    }
                  },
                  child: SizedBox(
                    height: size.height * 0.5,
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
                                "Pick Poster",
                                style: TextStyle(
                                  color: fontcolor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        : Image.network(imageList[0]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AddJobTextField(
                      controller: titlecontroller,
                      hintText: 'Job title',
                    ),
                    // AddJobTextField(
                    //     controller: rolecontroller, hintText: "Role"),
                    DropdownButtonFormField<String>(
                      iconSize: 30,
                      dropdownColor: black,
                      hint: Text(
                        "Select Roles",
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                      value: rolevalue,
                      items: roles.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20, color: white),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          rolevalue = newValue;
                        });
                      },
                    ),
                    // AddJobTextField(
                    //     controller: categorycontroller,
                    //     hintText: "Men/Woman/Girl/Boy"),
                    DropdownButtonFormField<String>(
                      iconSize: 30,
                      dropdownColor: black,
                      hint: Text(
                        "Select Category",
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                      value: categoryvalue,
                      items: category.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20, color: white),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          categoryvalue = newValue;
                        });
                      },
                    ),
                    // AddJobTextField(
                    //     controller: agecontroller, hintText: "Age Limit"),
                    DropdownButtonFormField<String>(
                      iconSize: 30,
                      dropdownColor: black,
                      hint: Text(
                        "AgeLimit",
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                      value: agevalue,
                      items: ageLimit.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20, color: white),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          agevalue = newValue;
                        });
                      },
                    ),
                    AddJobTextField(
                        controller: skillcontroller,
                        hintText: "Necessary Skill"),
                    AddJobTextField(
                        controller: contactcontroller,
                        hintText: "Contact(enter email)"),
                    AddJobTextField(
                        controller: deadlinecontroller, hintText: "DeadLine"),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    addJob(
                        Posts(
                          jobtitle: titlecontroller.text,
                          role: rolevalue.toString(),
                          category: categoryvalue.toString(),
                          age: agevalue.toString(),
                          skill: skillcontroller.text,
                          contact: contactcontroller.text,
                          deadline: deadlinecontroller.text,
                          imageList: imageList,
                        ),
                        context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: size.width * 0.20, vertical: 20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: black),
                      ))),
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              kheight,
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
