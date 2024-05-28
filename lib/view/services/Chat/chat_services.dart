import 'package:chat_app/view/services/Chat/image_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/utils/message.dart';

class ChatServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImageServices _imageServices = ImageServices();

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  // Send Message
  Future<void> sendMessage(String reciverId, String message) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String? currentUserEmail = _auth.currentUser!.email;
    final Timestamp timeStamp = Timestamp.now();

    // Create new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail!,
      reciverId: reciverId,
      message: message,
      timestamp: timeStamp,
    );

    List<String> ids = [currentUserId, reciverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Send Photo
  bool isLoading = false;
  Future<void> sendPhoto(String reciverId) async {
    isLoading = true;
    final String? downloadUrl = await _imageServices.uploadImage();

    if (downloadUrl == null) {
      return; // User cancelled the image picker or upload failed
    }

    final String currentUserId = _auth.currentUser!.uid;
    final String? currentUserEmail = _auth.currentUser!.email;
    final Timestamp timeStamp = Timestamp.now();

    // Create new message with image URL
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail!,
      reciverId: reciverId,
      message: '', // Message text is empty for photo
      timestamp: timeStamp,
      imageUrl: downloadUrl, // Set image URL
    );

    List<String> ids = [currentUserId, reciverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
    isLoading = false;
  }

  // Get Messages
  Stream<QuerySnapshot> getMessages(String userId, String senderId) {
    List<String> ids = [userId, senderId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
