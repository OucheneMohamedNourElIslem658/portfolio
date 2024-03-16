// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/screens/home/controllers/form.dart';

import '../../../../../constents/colors.dart';
import '../../../../../constents/text_styles.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
    required this.isSmall,
  });

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final formController = Get.put(FormController());

    if (!isSmall) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  validator: (value) => formController.nameValidation(),
                  controller: formController.nameController,
                  label: 'Full Name',
                  isOptional: false,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: CustomTextField(
                  validator: (value) => formController.emailValidation(),
                  controller: formController.emailController,
                  label: 'Email',
                  isOptional: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  validator: (value) => formController.phoneNumberValidation(),
                  controller: formController.phoneNumberController,
                  label: 'N°Tel',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: CustomTextField(
                  validator: (value) => formController.addressValidation(),
                  controller: formController.addressController,
                  label: 'Address',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (value) => formController.messageValidation(),
            controller: formController.messageController,
            label: 'Message',
            maxLines: 8,
            isOptional: false,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          CustomTextField(
            validator: (value) => formController.nameValidation(),
            controller: formController.nameController,
            label: 'Full Name',
            isOptional: false,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (value) => formController.emailValidation(),
            controller: formController.emailController,
            label: 'Email',
            isOptional: true,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (value) => formController.phoneNumberValidation(),
            controller: formController.phoneNumberController,
            label: 'N°Tel',
            
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (value) => formController.addressValidation(),
            controller: formController.addressController,
            label: 'Address',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (value) => formController.messageValidation(),
            controller: formController.messageController,
            label: 'Message',
            maxLines: 8,
            isOptional: false,
          ),
        ],
      );
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.maxLines = 1,
    this.isOptional = true
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: CustomColors.greenSecondary,
      style: TextStyles.headline9,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        errorStyle: TextStyles.headline21,
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyles.headline19,
              ),
              TextSpan(
                text: isOptional ? ' (optional)' : '',
                style: TextStyles.headline19,
              ),
            ]
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: CustomColors.greyBorder1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: CustomColors.redError,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: CustomColors.greenSecondary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: CustomColors.redError,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: CustomColors.greenSecondary,
          ),
        ),
      ),
    );
  }
}
