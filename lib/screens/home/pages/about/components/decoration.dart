import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '/screens/home/controllers/custom_navigation_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../constents/text_styles.dart';
import '../../../components/circled_text.dart';
import '../../../components/custom_elevated_button.dart';


class DecorationTexts extends StatelessWidget {
  const DecorationTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircledText(
          text: 'Welcome',
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I am ',
                style: TextStyles.headline5
              ),
              TextSpan(
                text: 'Cross \nPlatforme ',
                style: TextStyles.headline6
              ),
              TextSpan(
                text: 'Developer',
                style: TextStyles.headline5
              ),
            ]
          )
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            'I’m Mohamed Ouchene, a cross platform developer. i have an experiance of 1 year in flutter and firebase',
            style: TextStyles.headline7,
          ),
        ),
        const SizedBox(height: 20),
        const Buttons()
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(CustomNavigationController());

    return Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            navigationController.scrollToTarget(4);
            navigationController.hideAppBar();
          },
          child: Text(
            'Contact Me',
            style: TextStyles.headline8,
          ),
        ),
        const SizedBox(width: 15),
        AbstractButton(
          onPressed: () async => launchUrl(Uri.parse('https://github.com/OucheneMohamedNourElIslem658')),
        )
      ],
    );
  }
}

class AbstractButton extends StatelessWidget {
  const AbstractButton({
    super.key, 
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        side: BorderSide.none
      ),
      child: Row(
        children: [
          Text(
            "View Portofolio",
            style: TextStyles.headline9,
          ),
          const SizedBox(width: 8),
          SvgPicture.asset('assets/images/arrow_up.svg')
        ],
      )
    );
  }
}
