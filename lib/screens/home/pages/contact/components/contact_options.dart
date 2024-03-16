import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/custom_elevated_button.dart';
import '../../../../../constents/text_styles.dart';

class ContactOptions extends StatelessWidget {
  const ContactOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactOption(
          icon: 'assets/icons/phone.svg', 
          contactType: 'Call Me', 
          address: '+213774866447',
          onPressed: () async => await launchUrl(Uri.parse("tel://213774866447")),
        ),
        const SizedBox(height: 35),
        ContactOption(
          icon: 'assets/icons/email.svg', 
          contactType: 'Mail Me', 
          address: 'ouchenemohamednourelislam@gmail.com',
          onPressed: () async => await launchUrl(Uri.parse('mailto:ouchenemohamednourelislam@gmail.com?subject=${Uri.encodeComponent('Hello MOOH')}&body=${Uri.encodeComponent('')}')),
          padding: const EdgeInsets.symmetric(vertical: 22),
        ),
        const SizedBox(height: 35),
        ContactOption(
          icon: 'assets/icons/location.svg', 
          contactType: 'My Adress', 
          address: 'Ain Oulmene , Setif , Algeria',
          onPressed: () async => await launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=35.921833,5.295556')),
        ),
      ],
    );
  }
}

class ContactOption extends StatelessWidget {
  const ContactOption({
    super.key, 
    required this.icon, 
    required this.contactType, 
    required this.address,
    required this.onPressed,
    this.padding
  });

  final String icon,contactType,address;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomElevatedButton(
          onPressed: onPressed, 
          padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
          child: SvgPicture.asset(icon)
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contactType,
                style: TextStyles.headline19,
              ),
              Text(
                address,
                style: TextStyles.headline2,
              )
            ],
          ),
        )
      ],
    );
  }
}