import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/circled_text.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../../../constents/text_styles.dart';
import '../../../controllers/custom_navigation_controller.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(CustomNavigationController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircledText(
          text: "My Skills",
          bottom: 10,
          left: 12,
          focus: true
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 600,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Why Hire Me For Your Next ',
                  style: TextStyles.headline15
                ),
                TextSpan(
                  text: 'Project?',
                  style: TextStyles.headline14
                ),
              ]
            )
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 670,
          child: Text(
            'I’m cross platforme developer but a \'specialist\' in mobile development and I am a fast learner and the technologies i use provides a fast develpment experiance.',
            style: TextStyles.headline2,
          ),
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
          onPressed: () => navigationController.scrollToTarget(4), 
          child: Text(
            "Hire Me",
            style: TextStyles.headline8,
          )
        )
      ],
    );
  }
}