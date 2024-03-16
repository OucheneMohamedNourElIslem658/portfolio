import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constents/models.dart';
import '/constents/text_styles.dart';
import '/screens/home/controllers/db.dart';

class FormController extends GetxController {
  late TextEditingController emailController, nameController, phoneNumberController, addressController, messageController;
  late GlobalKey<FormState> formKey;
  bool? isEmailValidated, isNameValidated, isPhoneNumberValidated, isAddressValidated, isMessageValidated;
  final dBController = Get.put(DBController());
  bool isStoringData = false;

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    messageController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  String? emailValidation() {
    final isValidated = GetUtils.isEmail(emailController.text);
    isEmailValidated = isValidated;
    update();
    if (isEmailValidated! || emailController.text.trim() == '') {
      return null;
    }
    return 'Invalid email';
  }

  String? nameValidation() {
    final name = nameController.text.trim();
    isNameValidated = name.isNotEmpty && RegExp(r'^[a-zA-Z ]+$').hasMatch(name);
    update();
    if (name.isEmpty) {
      return 'Name is required.';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return 'Invalid characters in the name. Only alphabetic characters and spaces are allowed.';
    }
    return null;
  }

  String? phoneNumberValidation() {
    final phoneNumber = phoneNumberController.text.trim();
    isPhoneNumberValidated = RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(phoneNumber);
    update();
    if (isPhoneNumberValidated! || phoneNumber == '') {
      return null;
    }
    return 'Invalid phone number';
  }

  String? addressValidation() {
    final address = addressController.text.trim();
    isAddressValidated = address.isNotEmpty;
    update();
    if (isAddressValidated! || address == '') {
      return null;
    }
    return 'Invalid address';
  }

  String? messageValidation() {
    final message = messageController.text.trim();
    isMessageValidated = message.isNotEmpty && message.length > 10;
    update();
    if (!isMessageValidated!) {
      return 'Message should be at least 10 characters long.';
    }
    return null;
  }

  bool validateForm() {
    if (formKey.currentState != null) {
      return formKey.currentState!.validate();
    }
    return false;
  }

  void initializeForm(){
    emailController.text = '';
    nameController.text = '';
    addressController.text = '';
    phoneNumberController.text = '';
    messageController.text = '';
  }

  Future<String?> sendMessagetoDB() async {
    isStoringData = true;
    update();
    final error = await dBController.sendMessageToDB(
      Message(
        fromName: nameController.text, 
        fromEmail: emailController.text, 
        content: messageController.text, 
        phoneNumber: phoneNumberController.text,
        address: addressController.text,
      )
    );
    isStoringData = false;
    update();
    return error;
  }

  void showSuccessDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      width: 450,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Thank you !',
      titleTextStyle: TextStyles.headline23,
      desc: 'Your message had successfully been sent !',
      descTextStyle: TextStyles.headline24,
      headerAnimationLoop: false
    ).show();
  }

  void showFailDialog(BuildContext context){
    AwesomeDialog(
      width: 450,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Attention !',
      titleTextStyle: TextStyles.headline23,
      desc: 'Your message has not been sent try again later!',
      descTextStyle: TextStyles.headline24,
      headerAnimationLoop: false
    ).show();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
