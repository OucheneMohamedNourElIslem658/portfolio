import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/circled_text.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../../../constents/text_styles.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircledText(
          text: "Portofolio",
          bottom: 10,
          left: 8,
          focus: true
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 600,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'My Creative Works Latest ',
                  style: TextStyles.headline15
                ),
                TextSpan(
                  text: 'Projects.',
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
            'I’m specialist in Mobile development . My passion is developping and solving problems through applications .',
            style: TextStyles.headline2,
          ),
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
          onPressed: () async => launchUrl(Uri.parse('https://github.com/OucheneMohamedNourElIslem658?tab=repositories')), 
          child: Text(
            "See More",
            style: TextStyles.headline8,
          )
        )
      ],
    );
  }
}