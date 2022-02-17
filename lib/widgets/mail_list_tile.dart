import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmailclone/bloc/cubit.dart';
import 'package:gmailclone/bloc/state.dart';
import 'package:gmailclone/main_routes/mail_detail_route.dart';
import 'package:gmailclone/model/attach_file.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'dart:math' as math;

import 'package:gmailclone/widgets/file_icon.dart';

class MailTileWidget extends StatefulWidget {
  MailModel account;
  Function changeAppBar;

  MailTileWidget({
    required this.account,
    required this.changeAppBar
  });
  @override
  _MailTileWidgetState createState() => _MailTileWidgetState();
}

class _MailTileWidgetState extends State<MailTileWidget> with TickerProviderStateMixin{

  late AnimationController circleAvatarController;
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
    return BlocBuilder<AccountCubit, AccountDetail>(
      builder: (context, state){
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: widget.account.isSelected ? Colors.blue.withOpacity(0.2): null
            ),
            height: widget.account.attachedFile.isAttached ? 125 : 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: AnimatedBuilder(
                        builder: (context, child){
                          return Transform(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: widget.account.isSelected ? Colors.blueAccent : widget.account.senderInfo.profileColor.withOpacity(0.75),
                              child: TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0, end: 1),
                                builder: (context, double anim, child){
                                  return rotationAnim.value > 90
                                      ? Opacity(
                                    child: AnimatedScale(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                      duration: Duration(milliseconds: 150),
                                      scale: rotationAnim.value/180,
                                    ),
                                    opacity: rotationAnim.value/200 ,
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

                        setState(() {
                          widget.account.isSelected = !widget.account.isSelected;
                        });
                        widget.account.isSelected ? circleAvatarController.forward() : circleAvatarController.reverse();

                      },

                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.account.senderInfo.senderName,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: widget.account.isSeen
                                        ? FontWeight.normal
                                        : FontWeight.bold
                                ),
                              ),
                              Text(
                                  "10:00"
                              )
                            ],
                          )
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.account.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: widget.account.isSeen
                                ? FontWeight.normal
                                : FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                widget.account.content,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                child: widget.account.starred ? Icon(
                                  Icons.star,
                                  color: Colors.orange[300],
                                ):
                                Icon(
                                    Icons.star_border
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  widget.account.starred = !widget.account.starred;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      if(widget.account.attachedFile.isAttached) Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                            height: 35.0,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]!),
                                borderRadius: BorderRadius.circular(50.0)
                            ),
                            child: Row(
                              children: [
                                fileIcon(widget.account.attachedFile.fileType!),
                                Padding(
                                  padding: EdgeInsets.only(right: 3.0),
                                  child: Text(
                                    widget.account.attachedFile.fileName!,
                                    style: TextStyle(
                                        color: Colors.black54
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return MailDetailRoute(
                account: widget.account,
              );
            }));

          },
        );
      }
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    circleAvatarController.dispose();
    super.dispose();
  }
}
