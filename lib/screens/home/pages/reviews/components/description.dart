import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/circled_text.dart';
import '../../../../../constents/text_styles.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    this.focusedCircle = false
  });

  final bool focusedCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        focusedCircle
        ? const CircledText(
          text: "Reviews",
          focus: true,
          reverseFocus: true,
          bottom: 10,
          right: 15,
        )
        : const CircledText(
          text: "Reviews",
          focus: true,
          bottom: 10,
          left: 15,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(left: focusedCircle ? 68 : 0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Our Customers Said Something ',
                  style: TextStyles.headline15
                ),
                TextSpan(
                  text: 'About Us',
                  style: TextStyles.headline14
                ),
              ]
            )
          ),
        ),
      ],
    );
  }
}