import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'dart:math' as math;


/// Unwanted
///
class CircleAvatarWidget extends StatefulWidget {

  MailModel account;

  CircleAvatarWidget({
    required this.account
  });

  @override
  _CircleAvatarWidgetState createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> with SingleTickerProviderStateMixin{

  bool isSelected = false;
  late AnimationController circleAvatarController;
  late Animation colorAnim;
  late Animation<double> rotationAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    circleAvatarController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 450)
    );

    rotationAnim = Tween<double>(
        begin: 0,
        end: 180
    ).animate(CurvedAnimation(parent: circleAvatarController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
        builder: (context, child){
          return Transform(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: widget.account.isSelected ? Colors.blueAccent : widget.account.senderInfo.profileColor.withOpacity(0.75),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double anim, child){
                  log(anim.toString());
                  log(isSelected.toString());
                  return rotationAnim.value > 90
                      ? Opacity(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        opacity: anim ,
                      )
                      : Text(
                      widget.account.senderInfo.senderName[0].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                          color: Colors.white
                      ));
                },
                duration: const Duration(seconds: 1),
              ),
            ),
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY((rotationAnim.value) / 180 * math.pi),
          );
        },
        animation: circleAvatarController,
      ),
      onTap: (){
        //selectUnSelect(widget.index);
        setState(() {
          widget.account.isSelected = !widget.account.isSelected;
        });
        widget.account.isSelected ? circleAvatarController.forward() : circleAvatarController.reverse();


      },
    );
  }
}
