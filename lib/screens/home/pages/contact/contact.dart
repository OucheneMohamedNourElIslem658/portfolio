// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/components/custom_elevated_button.dart';
import 'package:portfolio/constents/text_styles.dart';
import 'package:portfolio/screens/home/controllers/form.dart';
import 'package:portfolio/screens/home/pages/about/components/custom_devider.dart';
import 'components/description.dart';
import 'components/contact_form.dart';
import 'components/contact_options.dart';
import 'components/developer_bar.dart';

class Contact extends StatelessWidget {
  const Contact({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    final formController = Get.put(FormController());

    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (size.width > 830) Positioned(
            top: 40,
            right: 0,
            child: SvgPicture.asset('assets/images/decoration10.svg')
          ) else const SizedBox(),
          if (size.width > 1100) Positioned(
            bottom: 160,
            right: 0,
            child: SvgPicture.asset('assets/images/decoration11.svg')
          ) else const SizedBox(),
          if (size.width > 1100) Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/images/decoration12.svg')
          ) else const SizedBox(),
          if (size.width > 1100) Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset('assets/images/decoration13.svg')
          ) else const SizedBox(),
          if (size.width > 700) AnimatedPositioned(
            top: 0,
            left: 0,
            bottom: size.width > 1100 ? 60 : -300,
            duration: const Duration(milliseconds: 400),
            child: SvgPicture.asset('assets/images/decoration14.svg')
          ) else const SizedBox(),
          Padding(
            padding:  EdgeInsets.only(
              left: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
              right: size.width > 1100 ? 150 : size.width > 730 ? 50 : 25,
            ),
            child: Form(
              key: formController.formKey,
              child: Column(
                children: [
                  const Description(),
                  const SizedBox(height: 40),
                  if (size.width > 920) Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: ContactOptions()
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            ContactForm(
                              isSmall: size.width < 1100
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GetBuilder<FormController>(
                                builder: (_) {
                                  return CustomElevatedButton(
                                    enabled: !formController.isStoringData,
                                    onPressed: () async {
                                      if (formController.validateForm()) {
                                        final error = await formController.sendMessagetoDB();
                                        if (error == null) {
                                          formController.initializeForm();
                                          formController.showSuccessDialog(context);
                                        } else {
                                          formController.showFailDialog(context);
                                        }
                                      }
                                    }, 
                                    child: Text(
                                      'Submit Message',
                                      style: TextStyles.headline8,
                                    )
                                  );
                                }
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ) else SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        const ContactOptions(),
                        const SizedBox(height: 35),
                        const ContactForm(isSmall: true),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomElevatedButton(
                            enabled: !formController.isStoringData,
                            onPressed: () async {
                              if (formController.validateForm()) {
                                final error = await formController.sendMessagetoDB();
                                if (error == null) {
                                  formController.initializeForm();
                                  formController.showSuccessDialog(context);
                                } else {
                                  formController.showFailDialog(context);
                                }
                              }
                            }, 
                            child: Text(
                              'Submit Message',
                              style: TextStyles.headline8,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  const CustomDevider(
                    width: double.infinity,
                    height: 2,
                  ),
                  const SizedBox(height: 20),
                  DeveloperBottomNavBar(isVertical: size.width < 850,),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}