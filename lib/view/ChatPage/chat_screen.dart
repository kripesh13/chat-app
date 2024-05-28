import 'dart:io';

import 'package:chat_app/constant/constant.dart';
import 'package:chat_app/constant/k_text_form_field.dart';
import 'package:chat_app/constant/ui_helpers.dart';
import 'package:chat_app/view/services/Chat/image_services.dart';
import 'package:chat_app/view/services/auth/auth.dart';
import 'package:chat_app/widget/image_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/custom_text_form_field.dart';
import '../../widget/chat_bubble.dart';
import '../services/Chat/chat_services.dart';

final TextEditingController messageController = TextEditingController();
final ChatServices _chatServices = ChatServices();
ImageServices _imageServices = ImageServices();

class ChatScreen extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;

  ChatScreen({
    Key? key,
    required this.receiverEmail,
    required this.receiverId,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthServices _authServices = AuthServices();
  final ScrollController _scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  void sendMessages() async {
    if (messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(
          widget.receiverId, messageController.text);
      messageController.clear();

      scrollDown();
    }
  }

  sendPhoto() async {
    await _chatServices.sendPhoto(widget.receiverId);
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(
          Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollDown());
  }

  @override
  void dispose() {
    focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Container(
        padding: kPadding(),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: messageList(),
              ),
            ),
            _sendMessage(() {
              sendMessages();
            }),
          ],
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot> messageList() {
    String senderId = _authServices.getCurrentUser()!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: _chatServices.getMessages(widget.receiverId, senderId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollDown());
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessage(doc, context))
                .toList(),
          );
        }
      },
    );
  }

  Widget _buildMessage(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser =
        data['senderId'] == _authServices.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Image.file(_imageServices.imageUrl as File),
          ChatBubble(
            isCurrentUser: isCurrentUser,
            message: data['message'],
          ),
        _imageServices.pickedFile != null? Image.file(_imageServices.imageUrl as File): Container(),
         ImageBubble(
            isCurrentUser: isCurrentUser,
            imageUrl: data['imageUrl'],
          )
        ],
      ),
    );
  }

  Widget _sendMessage(void Function()? sendMessages) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                sendPhoto();
              },
              icon: Icon(Icons.photo_camera)),
          Expanded(
            child: customTextField(
              focusNode: focusNode,
              controller: messageController,
              hintText: 'Enter Message',
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            margin: EdgeInsets.only(left: 25),
            child: IconButton(
              onPressed: sendMessages,
              icon: Icon(
                Icons.send,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
