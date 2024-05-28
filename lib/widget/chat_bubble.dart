import 'package:chat_app/constant/constant.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String message;

  const ChatBubble(
      {super.key, required this.isCurrentUser, required this.message,});

  @override
  Widget build(BuildContext context) {
    return message == ''? Container(): Container(
  margin: isCurrentUser
                ? EdgeInsets.fromLTRB(70, 5, 10, 5)
                : EdgeInsets.fromLTRB(10, 5, 60, 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: isCurrentUser ? Radius.circular(10) : Radius.circular(0),
                bottomRight: isCurrentUser ? Radius.circular(0) : Radius.circular(10),
                topRight: Radius.circular(10),
              ),
        color: message == '' ? null :isCurrentUser ? Colors.green : Colors.grey[500],
      ),
      child: Column(
        children: [
        message == '' ? Container() :  Text(
            message,
            style: kTextStyle().copyWith(color: whiteColor),
          ),
        ],
      ),
    );
  }
}
