import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constents/text_styles.dart';

class DeveloperBottomNavBar extends StatelessWidget {
  const DeveloperBottomNavBar({
    super.key, 
    this.isVertical = false
  });

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    if (!isVertical) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '@2024 | All rights reserved',
            style: TextStyles.headline7
          ),
          const Developer(),
          const SocialMediaItems()
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Text(
            '@2023 | All rights reserved',
            style: TextStyles.headline7
          ),
          const Developer(),
          const SizedBox(height: 5),
          const SocialMediaItems()
        ],
      );
    }
  }
}

class Developer extends StatelessWidget {
  const Developer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Developed By ',
            style: TextStyles.headline7
          ),
          TextSpan(
            text: 'Ouchene Mohamed',
            style: TextStyles.headline22
          )
        ]
      )
    );
  }
}

class SocialMediaItems extends StatelessWidget {
  const SocialMediaItems({
    super.key,
    this.isVertical = false
  });

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    if (!isVertical) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SocialMediaButton(
            icon: 'assets/icons/fb.svg',
            onPressed: () async => launchUrl(Uri.parse('https://web.facebook.com/mohamed.ouchene.9404'))
          ),
          const SizedBox(width: 25),
          SocialMediaButton(
            icon: 'assets/icons/insta.svg',
            onPressed: () async => launchUrl(Uri.parse('https://www.instagram.com/mooh__ouch/'))
          ),
          const SizedBox(width: 25),
          SocialMediaButton(
            icon: 'assets/icons/linked_in.svg', 
            onPressed: () async => launchUrl(Uri.parse('https://www.linkedin.com/in/mohamed-ouchene-1253862ba/'))
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SocialMediaButton(
            icon: 'assets/icons/fb.svg', 
            onPressed: () async => launchUrl(Uri.parse('https://web.facebook.com/mohamed.ouchene.9404'))
          ),
          const SizedBox(height: 25),
          SocialMediaButton(
            icon: 'assets/icons/insta.svg', 
            onPressed: () async => launchUrl(Uri.parse('https://www.instagram.com/mooh__ouch/'))
          ),
          const SizedBox(height: 25),
          SocialMediaButton(
            icon: 'assets/icons/linked_in.svg', 
            onPressed: () async => launchUrl(Uri.parse('https://www.linkedin.com/in/mohamed-ouchene-1253862ba/'))
          ),
        ],
      );
    }
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key, 
    required this.icon, 
    required this.onPressed
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(icon),
    );
  }
}