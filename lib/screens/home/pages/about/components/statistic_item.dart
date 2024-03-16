import 'package:flutter/material.dart';

import '../../../../../constents/text_styles.dart';


class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key, 
    required this.number, 
    required this.group
  });

  final int number;
  final String group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$number+',
          style: TextStyles.headline10,
        ),
        Text(
          group,
          style: TextStyles.headline11,
        )
      ],
    );
  }
}
