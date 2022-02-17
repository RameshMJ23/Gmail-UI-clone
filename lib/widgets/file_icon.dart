import 'package:flutter/material.dart';
import 'package:gmailclone/model/attach_file.dart';

Widget XcelWidget(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 15.0,
    width: 15.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.5),
      color: Colors.green
    ),
    child: Center(
      child: Text(
        "X",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0
        ),
      ),
    ),
  );
}

Widget WordWidget(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 15.0,
    width: 15.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.5),
        color: Colors.blueAccent
    ),
    child: Center(
      child: Text(
        "W",
        style: TextStyle(
            color: Colors.white,
            fontSize: 12.0
        ),
      ),
    ),
  );
}

Widget fileIcon(FileType fileType){
  switch(fileType){
    case FileType.word:
      return WordWidget();
    case FileType.excel:
      return XcelWidget();
    case FileType.image:
      return Icon(
        Icons.image,
        color: Colors.red,
      );
    case FileType.pdf:
      return Icon(
        Icons.picture_as_pdf,
        color: Colors.red,
      );

  }
}