import 'package:flutter/material.dart';


class SenderInfo{
  late String senderName;
  late String senderMail;
  late String? senderProfilePic;
  late Color profileColor;

  SenderInfo({
    required this.senderName,
    required this.senderMail,
    required this.senderProfilePic,
    required this.profileColor
  });
}