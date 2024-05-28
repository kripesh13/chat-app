import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/constant/constant.dart';
import 'package:flutter/material.dart';

class ImageBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String? imageUrl;

  const ImageBubble({super.key, required this.isCurrentUser, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCurrentUser
          ? EdgeInsets.fromLTRB(70, 5, 10, 5)
          : EdgeInsets.fromLTRB(10, 5, 60, 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: isCurrentUser ? Radius.circular(10) : Radius.circular(0),
          bottomRight: isCurrentUser ? Radius.circular(0) : Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: imageUrl == null
          ? Container()
          : Container(
            height: 150,
            child: CachedNetworkImage(
                imageUrl: imageUrl!,
               progressIndicatorBuilder: (context, url, downloadProgress) => 
                 Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                   errorWidget: (context, url, error) => Icon(Icons.error),
                   fit: BoxFit.cover,
                ),
          ),
    );
  }
}
