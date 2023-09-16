import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/applicant_details.dart';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewApplicantsScreen extends StatelessWidget {
  final String jobtitle;
  final Stream<QuerySnapshot> _applicantsStream;

  ViewApplicantsScreen({Key? key, required this.jobtitle})
      : _applicantsStream = FirebaseFirestore.instance
            .collection("applied")
            .where('jobtitle', isEqualTo: jobtitle)
            .snapshots(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kheight25,
                StreamBuilder<QuerySnapshot>(
                  stream: _applicantsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          List userPic = documents[index].get("image");
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(userPic[0]),
                            ),
                            title: Text(
                              documents[index].get("name").toString(),
                              style: TextStyle(color: white, fontSize: 25),
                            ),
                            subtitle: Text(
                                documents[index].get("age").toString(),
                                style: TextStyle(color: white, fontSize: 15)),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              ApplicantDetails(
                                                id: documents[index].get("id"),
                                                name: documents[index]
                                                    .get("name"),
                                                weight: documents[index]
                                                    .get("weight"),
                                                image: documents[index]
                                                    .get("image"),
                                                height: documents[index]
                                                    .get("height"),
                                                age:
                                                    documents[index].get("age"),
                                                skill: documents[index]
                                                    .get("skill"),
                                                experience: documents[index]
                                                    .get("experience"),
                                                about: documents[index]
                                                    .get("about"),
                                                qualification: documents[index]
                                                    .get("qualification"),
                                                currentjob: documents[index]
                                                    .get("currentjob"),
                                                userId: documents[index]
                                                    .get("userId"),
                                              )));
                                },
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: white,
                                  size: 25,
                                )),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ShimmerEffect();
                    } else {
                      return const ShimmerEffect();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
