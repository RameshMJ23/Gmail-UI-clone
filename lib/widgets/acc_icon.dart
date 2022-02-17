import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmailclone/bloc/cubit.dart';
import 'package:gmailclone/bloc/state.dart';
import 'dart:developer';

import 'package:gmailclone/main_routes/mail_route.dart';

class GmailAnim extends StatefulWidget {

  VoidCallback onTapFunc;
  Function swipeFunction;

  GmailAnim({
    required this.onTapFunc,
    required this.swipeFunction
  });

  @override
  _GmailAnimState createState() => _GmailAnimState();
}

class _GmailAnimState extends State<GmailAnim> with SingleTickerProviderStateMixin {

  List<CircleAvatar> avatars = [
    CircleAvatar(
      child: Text(
        "R",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Colors.white
        ),
      ),
      backgroundColor: Colors.red,
    ),
    CircleAvatar(
      child: Text(
        "J",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Colors.white
        ),
      ),
      backgroundColor: Colors.green,
    ),
    CircleAvatar(
      child: Text(
        "P",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    ),
  ];

  int index = 0;
  late AnimationController _controller;
  late Animation<double> sizeTween;
  late Animation<double> opacityTween;
  late Animation<Offset> offsetTweenUpward;
  late Animation<Offset> offsetTweenDownward;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));

    sizeTween = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem(
              tween: Tween(begin: 30, end: 0),
              weight: 50
          ),
          TweenSequenceItem(
              tween: Tween(begin: 0, end: 30),
              weight: 50
          )
        ]
    ).animate(_controller);

    opacityTween = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem(
              tween: Tween(begin: 1, end: 0),
              weight: 50
          ),
          TweenSequenceItem(
              tween: Tween(begin: 0, end: 1),
              weight: 50
          )
        ]
    ).animate(_controller);

    offsetTweenUpward = Tween<Offset>(
        begin: const Offset(0,0),
        end: const Offset(0, -1)
    ).animate(_controller);

    offsetTweenDownward = Tween<Offset>(
        begin: const Offset(0,0),
        end: const Offset(0, 1)
    ).animate(_controller);


    _controller.addStatusListener((status) {
      widget.swipeFunction;
      print(status.toString());
      log(status.toString());
      if(status == AnimationStatus.completed){
        _controller.reset();
        index = (index + 1) %
            avatars.length;
      }
    });
  }

  bool isUpward = false;

  @override
  Widget build(BuildContext context) {

    final offsetTween = isUpward ? offsetTweenUpward : offsetTweenDownward;

    return BlocBuilder<AccountCubit, AccountDetail>(
      builder: (context, state){
        return GestureDetector(
          child: ClipRRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child){
                return SlideTransition(
                  position: offsetTween,
                  child: AnimatedScale(
                    scale: opacityTween.value,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: avatars[index].backgroundColor
                      ),
                      child: Center(
                        child: avatars[index].child,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          onVerticalDragUpdate: (details){
            log(details.localPosition.direction.toString());
            if(details.localPosition.direction < 0){
              setState(() {
                isUpward = true;
                log(isUpward.toString());

              });
              _controller.forward();
              widget.swipeFunction();
            }else{
              setState(() {
                isUpward = false;
                log(isUpward.toString());
              });
              _controller.forward();
              widget.swipeFunction();
            }
          },
          onTap: widget.onTapFunc,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

}
