import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/model/applied/applied_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppliedScreen extends StatelessWidget {
  AppliedScreen({super.key});

  final Stream<QuerySnapshot> _poststream =
      FirebaseFirestore.instance.collection('AppliedPost').snapshots();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double postheight = (size.height - kToolbarHeight - 24) / 4.5;
    final double postwidth = size.width / 2;
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight25,
            kheight25,
            Text(
              "Applied Posts",
              style: TextStyle(fontSize: 30, color: white),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _poststream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: documents.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (postheight / postwidth),
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        return AppliedTile(
                          id: documents[index].get("id"),
                          jobtitle: documents[index].get("jobtitle"),
                          role: documents[index].get("role"),
                          image: documents[index].get("image"),
                          category: documents[index].get("category"),
                          age: documents[index].get("age"),
                          skill: documents[index].get("skill"),
                          contact: documents[index].get("contact"),
                          deadline: documents[index].get("deadline"),
                          userId: documents[index].get("userId"),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ShimmerEffect();
                  } else {
                    return const ShimmerEffect();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
