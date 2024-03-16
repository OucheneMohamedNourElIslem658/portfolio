class Message {
  final String fromName;
  final String? fromEmail;
  final String content;
  final String? phoneNumber;
  final String? address;

  Message({
    required this.fromName,
    this.fromEmail,
    required this.content,
    this.phoneNumber,
    this.address,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      fromName: map['fromName'],
      fromEmail: map['fromEmail'],
      content: map['content'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fromName': fromName,
      'fromEmail': fromEmail,
      'content': content,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}