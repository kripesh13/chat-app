import 'package:chat_app/constant/constant.dart';
import 'package:chat_app/constant/ui_helpers.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String message;
  const ChatBubble(
      {super.key, required this.isCurrentUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isCurrentUser ? Colors.green : Colors.grey[500],
      ),
      child: Text(
        message,
        style: kkWhiteTextStyle(),
      ),
    );
  }
}
