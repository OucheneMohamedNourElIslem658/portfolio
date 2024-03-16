import 'package:flutter/material.dart';
import '/constents/colors.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, 
    required this.onPressed, 
    required this.child,
    this.padding,
    this.enabled = true
  });

  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? CustomColors.greenPrimary : CustomColors.greyBorder1,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      child: child
    );
  }
}
