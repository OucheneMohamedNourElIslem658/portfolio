import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constents/text_styles.dart';


class CircledText extends StatelessWidget {
  const CircledText({
    super.key, 
    required this.text,
    this.focus = false,this.reverseFocus = false,
    this.top, this.bottom, this.left, this.right,
  });

  final String text;
  final bool focus,reverseFocus;
  final double? top,bottom,left,right;

  @override
  Widget build(BuildContext context) {
    if (!focus) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset('assets/images/circle.svg'),
          Text(
            text,
            style: TextStyles.headline4,
          ),
        ],
      );
    } else if (!reverseFocus) {
      return Stack(
        children: [
          SvgPicture.asset('assets/images/circle_focused.svg'),
          Positioned(
            bottom: bottom,
            left: left,
            top: top,
            right: right,
            child: Text(
              text,
              style: TextStyles.headline4,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          SvgPicture.asset('assets/images/circle_focused_left.svg'),
          Positioned(
            bottom: bottom,
            left: left,
            top: top,
            right: right,
            child: Text(
              text,
              style: TextStyles.headline4,
            ),
          ),
        ],
      );
    }
  }
}
