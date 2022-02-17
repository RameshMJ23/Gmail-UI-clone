import 'package:flutter/material.dart';

class CustomPopRoute extends PopupRoute{
  late Color setBarrierColor;
  late bool setBarrierDismissible;
  late String setBarrieLabel;
  late WidgetBuilder builder;


  CustomPopRoute({
    required this.setBarrieLabel,
    required this.setBarrierColor,
    required this.setBarrierDismissible,
    required this.builder
  });

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => setBarrierColor;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => setBarrierDismissible;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => setBarrieLabel;

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 600);
  
}