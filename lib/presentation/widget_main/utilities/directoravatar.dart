import 'dart:developer';
import 'dart:io';

import 'package:castingcallapp/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DirectorAvatar extends StatefulWidget {
  final IconData icon;
  const DirectorAvatar({
    super.key,
    required this.icon,
  });

  @override
  State<DirectorAvatar> createState() => _DirectorAvatarState();
}

String imageUrl =
    "https://img.freepik.com/free-vector/glitch-error-404-page_23-2148105404.jpg";

class _DirectorAvatarState extends State<DirectorAvatar> {
  @override
  void initState() {
    getImageList();
    super.initState();
  }

  getImageList() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('directors')
        .where('id', isEqualTo: userId)
        .get();
    log(userId);
    List<DocumentSnapshot> documents = snapshot.docs;
    List<dynamic> directorDataList =
        documents.map((doc) => doc.data()).toList();
    if (mounted) {
      setState(() {
        //imageUrl = directorDataList[0]['image'];
        if (directorDataList.isNotEmpty &&
            directorDataList[0].containsKey('image')) {
          imageUrl = directorDataList[0]['image'];
        } else {
          imageUrl =
              'https://img.freepik.com/free-vector/glitch-error-404-page_23-2148105404.jpg';
        }
      });
      log(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Container(
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
              onPressed: () {
                uploadImage();
              },
              icon: Icon(
                widget.icon,
                color: white,
              )),
        ),
      ],
    );
  }

  uploadImage() async {
    final firebaseStorage = FirebaseStorage.instance;
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      var snapshot =
          await firebaseStorage.ref().child('images').putFile(File(file.path));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    } else {
      // ignore: avoid_print
      print("No image path recieved");
    }
  }
}
