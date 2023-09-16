import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/model/notify/widgets/notify_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// List<dynamic> availableShortlisted = [];
// List<dynamic> filteredShortlisted = [];

class NotifyScreen extends StatefulWidget {
  final Stream<QuerySnapshot> _notifyStream;

  NotifyScreen({
    Key? key,
  })  : _notifyStream = FirebaseFirestore.instance
            .collection("shortlist")
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
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
                Center(
                  child: Text(
                    "Audition Details Here",
                    style: TextStyle(
                      color: fontcolor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                kheight25,
                StreamBuilder<QuerySnapshot>(
                  stream: widget._notifyStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      // availableShortlisted = documents;

                      return Column(
                        children: [
                          // kheight25,
                          // NotifySearchWidget(onChanged: filterShortlisted),
                          kheight25,
                          ListView.separated(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: documents.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: white,
                                title: Text(
                                  documents[index].get("title").toString(),
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    documents[index].get("name").toString(),
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                trailing: Text(
                                  documents[index].get("date").toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => NotifyDetails(
                                                id: documents[index].get("id"),
                                                name: documents[index]
                                                    .get("name"),
                                                title: documents[index]
                                                    .get("title"),
                                                director: documents[index]
                                                    .get("director"),
                                                date: documents[index]
                                                    .get("date"),
                                                time: documents[index]
                                                    .get("time"),
                                                venue: documents[index]
                                                    .get("venue"),
                                              )));
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ],
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
