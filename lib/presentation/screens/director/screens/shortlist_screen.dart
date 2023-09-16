import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/domain/shortlistmodel.dart';
import 'package:castingcallapp/presentation/screens/director/utility/job_text_field.dart';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:flutter/material.dart';

class ShortlistScreen extends StatefulWidget {
  final String userId;
  final String name;
  const ShortlistScreen({
    super.key,
    required this.userId,
    required this.name,
  });

  @override
  State<ShortlistScreen> createState() => _ShortlistScreenState();
}

class _ShortlistScreenState extends State<ShortlistScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController directorcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();
  final TextEditingController venuecontroller = TextEditingController();
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
            "Add audition details",
            style: TextStyle(fontSize: 25, color: fontcolor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AddJobTextField(
                      controller: titlecontroller,
                      hintText: 'Job title',
                    ),
                    AddJobTextField(
                        controller: directorcontroller, hintText: "Director"),
                    AddJobTextField(
                        controller: datecontroller, hintText: "Audition date"),
                    AddJobTextField(
                        controller: timecontroller, hintText: "Time"),
                    AddJobTextField(
                        controller: venuecontroller, hintText: "Venue"),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    shortlisted(
                        Shortlist(
                          userId: widget.userId,
                          name: widget.name,
                          title: titlecontroller.text,
                          director: directorcontroller.text,
                          date: datecontroller.text,
                          time: timecontroller.text,
                          venue: venuecontroller.text,
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
                    "Send",
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
}
