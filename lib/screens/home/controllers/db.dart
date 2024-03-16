import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '/constents/models.dart';

class DBController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final cVURL = 'portfolio/doctor_hunt.png';

  Future<String?> sendMessageToDB(Message message) async {
    try {
      final messages = firestore.collection('messages');
      final messageMap = message.toMap();
      messageMap['dateTime'] = Timestamp.now();
      await messages.add(messageMap);
      return null;
    } catch (error) {
      return error.toString();
    }
  }
}