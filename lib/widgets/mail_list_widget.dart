import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmailclone/bloc/cubit.dart';
import 'package:gmailclone/bloc/state.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'package:gmailclone/widgets/circle_avatar_widget.dart';
import 'package:gmailclone/widgets/mail_list_tile.dart';
import 'dart:math' as math;

import 'package:rive/rive.dart';

class MailList extends StatefulWidget {
  int index;
  MailModel account;
  UniqueKey key;
  Function changeAppBar;

  MailList({
    required this.index,
    required this.account,
    required this.key,
    required this.changeAppBar
  }): super(key:  key);

  @override
  _MailListState createState() => _MailListState();
}

class _MailListState extends State<MailList> {

  late OneShotAnimation _riveAnimationController1;
  late OneShotAnimation _riveAnimationController2;


  @override
  void initState() {
    // TODO: implement initState
    _riveAnimationController1 = OneShotAnimation(
      "Animation 1",
      autoplay: false,
    );

    _riveAnimationController2 = OneShotAnimation(
      "Animation 1",
      autoplay: false,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountDetail>(
      builder: (context, state){
        return Listener(
          key: UniqueKey(),
          child: Dismissible(
            key: ValueKey(widget.index),
            child: GestureDetector(
              key: ValueKey(widget.index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
                child: MailTileWidget(
                  account: widget.account,
                  changeAppBar: widget.changeAppBar,
                ),
              ),
              onTap: (){

              },
            ),
            background: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: dragWidget(
                        left: 8.0,
                        controller: _riveAnimationController1
                    )),
              ],
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 8.0
                ),
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: RiveAnimation.asset(
                    "assets/gmail_drag_anim.riv",
                    controllers: [
                      _riveAnimationController2
                    ],
                    animations: [
                      "Animation 1"
                    ],
                    fit: BoxFit.fill,
                    //antialiasing: false,
                  ),
                ),
              ),
            ),
            onDismissed: (direction){

            },
          ),
        );
      }
    );
  }



  Widget dragWidget({
    double? left,
    double? right,
    required OneShotAnimation controller
  }){
    return Container(
      alignment: right != null ? Alignment.centerRight : Alignment.centerLeft,
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.only(
            left: left != null ? left : 0.0,
            right: right != null ? right: 0.0
        ),
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: RiveAnimation.asset(
            "assets/gmail_drag_anim.riv",
            controllers: [
              controller
            ],
            animations: [
              "Animation 1"
            ],
            fit: BoxFit.fill,
            //antialiasing: false,
          ),
        ),
      ),
    );
  }
}
