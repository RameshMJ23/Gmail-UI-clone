import 'package:flutter/material.dart';
import 'package:gmailclone/model/attach_file.dart';
import 'package:gmailclone/model/sender_info_model.dart';

class MailModel{
  late SenderInfo senderInfo;
  late String title;
  late String content;
  late AttachedFile attachedFile;
  late bool starred;
  late bool isSeen;
  //late String mailImage; //image inside mail
  late DateTime dateTime;
  late Color defaultOnSelectedColor;
  late IconData defaultOnSelectedIcon;
  late bool isSelected;

  MailModel(
    {
      required this.senderInfo,
      required this.title,
      required this.content,
      required this.attachedFile,
      required this.starred,
      required this.isSeen,
      required this.dateTime,
      this.defaultOnSelectedColor = Colors.blueAccent,
      this.defaultOnSelectedIcon = Icons.check,
      required this.isSelected
    }
  );


}