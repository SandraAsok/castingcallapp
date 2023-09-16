// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:flutter/material.dart';

class NotifyDetails extends StatelessWidget {
  final String id;
  final String name;
  final String title;
  final String director;
  final String date;
  final String time;
  final String venue;

  NotifyDetails({
    super.key,
    required this.id,
    required this.name,
    required this.title,
    required this.director,
    required this.date,
    required this.time,
    required this.venue,
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
                  "Your audition details are here!",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: fontcolor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                      "Movie :\t\t $title",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
                      ),
                    ),
                    kheight,
                    Text(
                      "Applicant :\t\t $name",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
                      ),
                    ),
                    kheight,
                    Text(
                      "Director:\t\t $director",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
                      ),
                    ),
                    kheight,
                    Text(
                      "Audition date:\t\t $date",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
                      ),
                    ),
                    kheight,
                    Text(
                      "Audition time:\t\t $time",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
                      ),
                    ),
                    kheight,
                    Text(
                      "Audition Venue:\t\t \n$venue",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: fontcolor,
                        fontSize: 25,
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
