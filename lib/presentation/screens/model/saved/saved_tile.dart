import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/model/saved/saved_details.dart';
import 'package:flutter/cupertino.dart';

class SavedTile extends StatelessWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;
  const SavedTile({
    super.key,
    required this.id,
    required this.jobtitle,
    required this.role,
    required this.image,
    required this.category,
    required this.age,
    required this.skill,
    required this.contact,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SavedDetails(
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
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.cover,
                )),
          ),
          kheight,
        ],
      ),
    );
  }
}
