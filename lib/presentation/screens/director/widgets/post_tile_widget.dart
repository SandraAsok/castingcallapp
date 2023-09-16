import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/core/firebase_functions.dart';
import 'package:castingcallapp/presentation/screens/director/widgets/job_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;

  const PostTile({
    Key? key,
    required this.id,
    required this.image,
    required this.jobtitle,
    required this.role,
    required this.category,
    required this.age,
    required this.skill,
    required this.contact,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => JobDetails(
                id: id,
                jobtitle: jobtitle,
                role: role,
                image: image,
                category: category,
                age: age,
                skill: skill,
                contact: contact,
                deadline: deadline,
              ),
            ));
      },
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.cover,
                )),
            child: Stack(
              children: [
                Positioned(
                  left: 125,
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: black,
                              title: Text("Delete Confirmation",
                                  style: TextStyle(color: white)),
                              content: Text(
                                  "Are You Sure? Do you want to delete this Post?",
                                  style: TextStyle(color: white)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Cancel",
                                      style: TextStyle(color: white)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("Delete",
                                      style: TextStyle(color: white)),
                                )
                              ],
                            );
                          },
                        ).then((value) {
                          if (value != null && value) {
                            deletePost(id, context);
                          }
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.delete_solid,
                        color: black,
                        size: 25,
                      )),
                )
              ],
            ),
          ),
          kheight,
          Text(
            jobtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                letterSpacing: .5,
                fontSize: 20,
                color: white,
                fontWeight: FontWeight.w900),
          ),
          Text(
            role,
            style: TextStyle(
                letterSpacing: .5,
                fontSize: 15,
                color: white,
                fontWeight: FontWeight.w700),
          ),
          kheight,
        ],
      ),
    );
  }
}
