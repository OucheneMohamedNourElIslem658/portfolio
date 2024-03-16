import 'package:flutter/material.dart';

import '../../../../../constents/colors.dart';


class CustomDevider extends StatelessWidget {
  const CustomDevider({
    super.key, 
    this.width, 
    this.height
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 80,
      width: width ?? 4,
      color: CustomColors.greenPrimary,
    );
  }
}
