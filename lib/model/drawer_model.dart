import 'package:flutter/material.dart';

class DrawerModel{
  late Icon itemIcon;
  late String itemName;
  late String? itemTrail;

  DrawerModel(
    {
      required this.itemIcon,
      required this.itemName,
      required this.itemTrail,
    }
  );
}
