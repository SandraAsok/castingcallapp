import 'dart:developer';
import 'package:castingcallapp/domain/appliedmodel.dart';
import 'package:castingcallapp/domain/appliedpost.dart';
import 'package:castingcallapp/domain/postmodel.dart';
import 'package:castingcallapp/domain/savemodel.dart';
import 'package:castingcallapp/domain/shortlistmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//add casting call job -  director side
Future<void> addJob(Posts postmodel, BuildContext context) async {
  final post = FirebaseFirestore.instance.collection('posts');
  final reference = post.doc();
  try {
    SnackBar(
      content: const Text("Job Posted"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'age': postmodel.age,
      'category': postmodel.category,
      'contact': postmodel.contact,
      'deadline': postmodel.deadline,
      'id': reference.id,
      'image': postmodel.imageList,
      'jobtitle': postmodel.jobtitle,
      'role': postmodel.role,
      'skill': postmodel.skill,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed");
  }
}

//Snackbar
void showSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 100.0),
    content: Text(message),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

//delete post - director side
Future<void> deletePost(String id, BuildContext context) {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  return posts.doc(id).delete().then((value) {
    log("Post Deleted");
    showSnackbar(context, "Post deleted");
  }).catchError((error) {
    log("Failed to delete product: $error");
    showSnackbar(context, "Failed to delete Post");
  });
}

//Delete from saved - model side
Future<void> removeSaved(String id, BuildContext context) {
  CollectionReference saved = FirebaseFirestore.instance.collection('Saved');

  return saved.doc(id).delete().then((value) {
    log("Removed");
    showSnackbar(context, "Removed");
  }).catchError((error) {
    log("Failed to delete product: $error");
    showSnackbar(context, "Failed to Remove");
  });
}

//add to saved - model side
Future<void> addSaved(Saved savedmodel, BuildContext context) async {
  final post = FirebaseFirestore.instance.collection('Saved');
  final reference = post.doc();
  try {
    SnackBar(
      content: const Text("Post Saved"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'age': savedmodel.age,
      'category': savedmodel.category,
      'contact': savedmodel.contact,
      'deadline': savedmodel.deadline,
      'id': reference.id,
      'image': savedmodel.imageList,
      'jobtitle': savedmodel.jobtitle,
      'role': savedmodel.role,
      'skill': savedmodel.skill,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed");
  }
}

//listing applicants
Future<void> addApplied(Applied appliedmodel, BuildContext context) async {
  final applied = FirebaseFirestore.instance.collection('applied');
  final reference = applied.doc();
  try {
    SnackBar(
      content: const Text("Job Applied"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'jobtitle': appliedmodel.jobtitle,
      'name': appliedmodel.name,
      'age': appliedmodel.age,
      'height': appliedmodel.height,
      'weight': appliedmodel.weight,
      'qualification': appliedmodel.qualification,
      'currentjob': appliedmodel.currentjob,
      'skill': appliedmodel.skill,
      'experience': appliedmodel.experience,
      'about': appliedmodel.about,
      'id': reference.id,
      'image': appliedmodel.imageList,
      'userId': appliedmodel.userId,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed");
  }
}

//listing applied posts
Future<void> appliedPost(AppliedPost AppliedPost, BuildContext context) async {
  final posts = FirebaseFirestore.instance.collection('AppliedPost');
  final reference = posts.doc();
  try {
    SnackBar(
      content: const Text("Post Applied"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'age': AppliedPost.age,
      'category': AppliedPost.category,
      'contact': AppliedPost.contact,
      'deadline': AppliedPost.deadline,
      'id': reference.id,
      'image': AppliedPost.imageList,
      'jobtitle': AppliedPost.jobtitle,
      'role': AppliedPost.role,
      'skill': AppliedPost.skill,
      'userId': AppliedPost.userId,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed");
  }
}

//listing shortlisted applicants
Future<void> shortlisted(Shortlist shortlist, BuildContext context) async {
  final shortlisted = FirebaseFirestore.instance.collection('shortlist');
  final reference = shortlisted.doc();
  try {
    SnackBar(
      content: const Text("Details Sent"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      "id": reference.id,
      "userId": shortlist.userId,
      "name": shortlist.name,
      "title": shortlist.title,
      "director": shortlist.director,
      "date": shortlist.date,
      "time": shortlist.time,
      "venue": shortlist.venue,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed");
  }
}

//Reject button -  director side
Future<void> reject(String id, BuildContext context) {
  CollectionReference applied =
      FirebaseFirestore.instance.collection('applied');

  return applied.doc(id).delete().then((value) {
    log("Rejected");
    showSnackbar(context, "Rejected");
  }).catchError((error) {
    log("Failed to reject applicant: $error");
    showSnackbar(context, "Failed to reject");
  });
}
