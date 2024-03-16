import 'package:flutter/material.dart';

import '../../../../../constents/colors.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    super.key, 
    this.focusedItemsNumber = 2
  });

  final int focusedItemsNumber;

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'image' : "assets/images/portfolio.png"
      },
      {
        'image' : "assets/images/doctor_hunt.png"
      },
      {
        'image' : "assets/images/quizz_game.png"
      }
    ];
    return SizedBox(
      width: focusedItemsNumber == 2 ? 460 : 460 + 240,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            projects.length, 
            (index) {
              final project = projects[index];
              final image = project['image'] as String;
              return Padding(
                padding: EdgeInsets.only(
                  right:  index == projects.length -1 
                    ? 20 
                    : 40,
                  left: 20,
                  top: 20,
                  bottom: 20
                ) ,
                child: Project(
                  image: image,
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class Project extends StatelessWidget {
  const Project({
    super.key,
    required this.image
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage(image)
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.greyShadow.withOpacity(0.1),
            blurRadius: 11,
            spreadRadius: 20
          )
        ]
      ),
    );
  }
}