import 'dart:developer';

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/custom_search_widget.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/post_tile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<dynamic> availableposts = [];
List<dynamic> filteredposts = [];

class DirSearchScreen extends StatefulWidget {
  const DirSearchScreen({super.key});

  @override
  State<DirSearchScreen> createState() => _DirSearchScreenState();
}

class _DirSearchScreenState extends State<DirSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double postheight = (size.height - kToolbarHeight - 24) / 2.3;
    final double postwidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              kheight,
              CustomSearchWidget(onChanged: filterPosts),
              kheight,
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("posts").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error : ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    log("Data occurs");
                    availableposts = snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredposts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (postwidth / postheight),
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot postSnap = filteredposts[index];
                        return PostTile(
                          id: postSnap['id'],
                          image: postSnap['image'],
                          jobtitle: postSnap['jobtitle'],
                          role: postSnap['role'],
                          category: postSnap['category'],
                          age: postSnap['age'],
                          skill: postSnap['skill'],
                          contact: postSnap['contact'],
                          deadline: postSnap['deadline'],
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ShimmerEffect();
                  }
                  return const ShimmerEffect();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  void filterPosts(String query) {
    setState(() {
      filteredposts = availableposts.where((doc) {
        String name = doc.data()['jobtitle'].toLowerCase();
        String searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();
    });
  }
}
