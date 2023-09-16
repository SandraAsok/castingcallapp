import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          color: black,
          child: const Image(
            image: AssetImage('assets/images/pic4.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: black,
          child: Row(
            children: [
              const Spacer(),
              Icon(
                Icons.favorite_border,
                color: white,
                size: 20,
              ),
              Text(
                "100k",
                style: TextStyle(color: white, fontSize: 20),
              ),
              const Spacer(),
              Icon(
                Icons.video_collection,
                color: white,
                size: 20,
              ),
              const Spacer(),
              Icon(
                Icons.star,
                color: white,
                size: 20,
              ),
              const Spacer(),
              Icon(
                Icons.navigate_next,
                color: white,
                size: 40,
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
