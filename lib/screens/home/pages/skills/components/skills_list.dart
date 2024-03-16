import 'package:flutter/material.dart';
import '/constents/colors.dart';

import '../../../../../constents/text_styles.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({
    super.key,
    this.isVertical = true
  });

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'icon': Icons.phone_android,
        'name': 'Android & ios Apps',
        'description': 'create mobile applications for both ios and android'
      },
      {
        'icon': Icons.desktop_windows,
        'name': 'Desktop and web Apps',
        'description': 'create desktop apps for windows ,linux and macos also small size websites'
      },
      {
        'icon': Icons.code_rounded,
        'name': 'Back-end functionalites',
        'description': 'I work with flutterfire, firebase_admin with express and currently I am learning go'
      }
    ];

    if (isVertical) {
      return Column(
        children: List.generate(
          skills.length, 
          (index) {
            final skill = skills[index];
            final name = skill['name'] as String;
            final description = skill['description'] as String;
            final icon = skill['icon'] as IconData;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index != skills.length-1 ? 50 : 0
              ),
              child: SizedBox(
                width: 280,
                child: Skill(
                  icon: icon,
                  name: name,
                  description: description
                ),
              ),
            );
          }
        ),
      );
    } else {
      return Wrap(
        spacing: 30,
        runSpacing: 30,
        children: List.generate(
          skills.length, 
          (index) {
            final skill = skills[index];
            final name = skill['name'] as String;
            final description = skill['description'] as String;
            final icon = skill['icon'] as IconData;
            return SizedBox(
              width: 280,
              child: Skill(
                icon: icon,
                name: name,
                description: description
              ),
            );
          }
        ),
      );
    }
  }
}

class Skill extends StatelessWidget {
  const Skill({
    super.key,
    required this.name,
    required this.description,
    required this.icon
  });

  final String? name;
  final String? description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: CustomColors.greenPrimary,
              size: 30,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                name!,
                style: TextStyles.headline13,
              ),
            )
          ],
        ),
        Text(
          description!,
          style: TextStyles.headline7,
        )
      ],
    );
  }
}