import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/model/home/widgets/home_appbar.dart';
import 'package:castingcallapp/presentation/screens/model/widgets/job_apply_tile.dart';
import 'package:flutter/material.dart';

class ModelHome extends StatelessWidget {
  const ModelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: ModelHomeAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              kheight,
              JobApplyTile(),
            ],
          ),
        ),
      ),
    );
  }
}
