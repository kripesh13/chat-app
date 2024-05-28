import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String reciverId;
  final String message;
  final Timestamp timestamp;
  final String? imageUrl; // Add this field

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.reciverId,
    required this.message,
    required this.timestamp,
    this.imageUrl, // Update constructor
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'reciverId': reciverId,
      'message': message,
      'timestamp': timestamp,
      'imageUrl': imageUrl, // Add this field to map
    };
  }
}
