import 'package:flutter/material.dart';

import '../../../../../constents/colors.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key, 
    required this.onPressed, 
    required this.child, 
    this.padding
  });

  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        side: BorderSide(
          color: CustomColors.greenSecondary
        ),
        backgroundColor: CustomColors.white
      ),
      child: child
    );
  }
}
