import 'dart:developer';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/custom_model_search_widget.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/model_apply_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<dynamic> availableCategories = [];
List<dynamic> filteredCategories = [];

class ModelSearchScreen extends StatefulWidget {
  const ModelSearchScreen({super.key});

  @override
  State<ModelSearchScreen> createState() => _ModelSearchScreenState();
}

class _ModelSearchScreenState extends State<ModelSearchScreen> {
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
              CustomModelSearchWidget(onChanged: filterCategory),
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
                    availableCategories = snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (postwidth / postheight),
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot postSnap =
                            filteredCategories[index];
                        return ModelApplyTile(
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

  void filterCategory(String query) {
    setState(() {
      filteredCategories = availableCategories.where((doc) {
        String category = doc.data()['category'].toLowerCase();
        String searchLower = query.toLowerCase();
        return category.contains(searchLower);
      }).toList();
    });
  }
}
