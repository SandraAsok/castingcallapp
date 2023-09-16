import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/apply_details.dart';
import 'package:flutter/cupertino.dart';

class ModelApplyTile extends StatelessWidget {
  final String id;
  final String jobtitle;
  final String role;
  final List<dynamic> image;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;

  const ModelApplyTile({
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
              fullscreenDialog: true,
              builder: (context) => ApplyDetails(
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
          ),
          kheight,
          Text(
            jobtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                letterSpacing: .5,
                fontSize: 20,
                color: fontcolor,
                fontWeight: FontWeight.w900),
          ),
          Text(
            role,
            style: TextStyle(
                letterSpacing: .5,
                fontSize: 15,
                color: fontcolor,
                fontWeight: FontWeight.w700),
          ),
          kheight,
        ],
      ),
    );
  }
}
