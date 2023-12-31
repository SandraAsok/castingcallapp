import 'package:castingcallapp/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1 / 1.8,
      shrinkWrap: true,
      children: List.generate(4, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer(
              gradient: LinearGradient(colors: [black, white, black]),
              child: Container(
                height: 180,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Shimmer(
              gradient: LinearGradient(colors: [black, white, black]),
              child: Container(
                height: 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Shimmer(
              gradient: LinearGradient(colors: [black, white, black]),
              child: Container(
                height: 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Shimmer(
              gradient: LinearGradient(colors: [black, white, black]),
              child: Container(
                height: 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Shimmer(
              gradient: LinearGradient(colors: [black, white, black]),
              child: const SizedBox(
                height: 30,
                width: 100,
              ),
            ),
          ],
        );
      }),
    );
  }
}
