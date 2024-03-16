import 'package:flutter/material.dart';

import '../../../components/circled_text.dart';
import '../../../../../../constents/text_styles.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircledText(text: "Contact"),
        const SizedBox(height: 15),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Let’s Discuss Your ',
                style: TextStyles.headline15
              ),
        
              TextSpan(
                text: 'Project',
                style: TextStyles.headline14
              ),
            ]
          )
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 670,
          child: Text(
            'If you have any ideas or opinion about any thing lets discuss it now am open when ever you need me!',
            textAlign: TextAlign.center,
            style: TextStyles.headline2,
          ),
        ),
      ],
    );
  }
}