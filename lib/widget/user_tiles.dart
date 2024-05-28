import 'package:chat_app/constant/constant.dart';
import 'package:flutter/material.dart';

class UserTiles extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const UserTiles({super.key, required this.ontap,required this.text});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: kPadding(),
        decoration: BoxDecoration(
          
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)

        ),
        child: Row(children: [
          Icon(Icons.person,color: whiteColor,),
          maxWidthSpan(),
          Text(text,style: kTextStyle().copyWith(color: whiteColor)),
        ],),
      ),
    );
  }
}