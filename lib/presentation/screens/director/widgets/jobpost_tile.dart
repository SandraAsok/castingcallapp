import 'package:castingcallapp/presentation/screens/director/utility/shimmer_widget.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/post_tile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobPostTile extends StatelessWidget {
  JobPostTile({super.key});

  final Stream<QuerySnapshot> _poststream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double postheight = (size.height - kToolbarHeight - 24) / 5;
    final double postwidth = size.width / 2;
    return StreamBuilder<QuerySnapshot>(
        stream: _poststream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
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
                return PostTile(
                  id: documents[index].get('id'),
                  image: documents[index].get('image'),
                  jobtitle: documents[index].get('jobtitle'),
                  role: documents[index].get('role'),
                  category: documents[index].get('category'),
                  age: documents[index].get('age'),
                  skill: documents[index].get('skill'),
                  contact: documents[index].get('contact'),
                  deadline: documents[index].get('deadline'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmerEffect();
          } else {
            return const ShimmerEffect();
          }
        });
  }
}
