import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constents/colors.dart';
import '../../../constents/text_styles.dart';
import '../controllers/custom_navigation_controller.dart';
import '../pages/about/components/custom_outlined_button.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.size, 
    this.backgroundColor
  });

  final Size size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar( 
      backgroundColor: backgroundColor ?? CustomColors.transparent,
      scrolledUnderElevation: 1000,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: size.width > 980
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "MOHAMED OUCHENE",
              style: TextStyles.headline1,
            ),
            if (size.width > 980) const NavigationBottons() else const SizedBox(),
            if (size.width > 730) CustomOutlinedButton(
                onPressed: () async => await launchUrl(Uri.parse('https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/portfolio%2Fouchene-mohamed-portfolio.pdf?alt=media&token=509adbb8-1f1e-4918-a871-c0c6e66e6c0c')),
                child: Text(
                  'Download CV',
                  style: TextStyles.headline4,
                ),
              ) else SizedBox(
                width: 40,
                child: Center(
                  child: CustomOutlinedButton(
                    onPressed: () async => await launchUrl(Uri.parse('https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/portfolio%2Fouchene-mohamed-portfolio.pdf?alt=media&token=509adbb8-1f1e-4918-a871-c0c6e66e6c0c')), 
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.download_rounded,
                      color: CustomColors.greenSecondary,
                    )
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class NavigationBottons extends StatelessWidget {
  const NavigationBottons({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(CustomNavigationController());

    return GetBuilder<CustomNavigationController>(
      builder: (_) {
        return Row(
          children: List.generate(
            navigationController.options.length, 
            (index) {
              final navigationButtons = navigationController.options;
              final navigationButton = navigationButtons[index];
              final name = navigationButton['name'] as String;
              final isHovered = navigationButton['isHovered'] as bool;
              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: MouseRegion(
                  // onHover:(event) => navigationController.hoverItem(index),
                  child: TextButton(
                    onPressed: () {
                      navigationController.hoverItem(index);
                      navigationController.scrollToTarget(index);
                    },
                    child: Text(
                      name,
                      style: isHovered
                        ? TextStyles.headline3
                        : TextStyles.headline2,
                    )
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}