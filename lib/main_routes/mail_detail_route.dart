import 'dart:developer' ;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'package:gmailclone/widgets/file_icon.dart';

class MailDetailRoute extends StatefulWidget {
  MailModel account;

  MailDetailRoute({
    required this.account
  });

  @override
  _MailDetailRouteState createState() => _MailDetailRouteState();
}

class _MailDetailRouteState extends State<MailDetailRoute> with SingleTickerProviderStateMixin{

  bool isExpanded = false;
  late AnimationController _arrowController;
  late Animation<double> arrowAnim;

  @override
  void initState() {
    // TODO: implement initState
    _arrowController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this
    );

    arrowAnim = Tween<double>(begin: 0.0, end: 0.5).animate(_arrowController);
    widget.account.isSeen = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(
            Icons.archive_outlined,
            color: Colors.black54,
            size: 25.0,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Icon(
              Icons.delete_outline,
            color: Colors.black54,
            size: 25.0,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.mail_outline,
            color: Colors.black54,
            size: 25.0,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black54,
            size: 25.0,
          ),
          const SizedBox(
            width: 15.0,
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 8.0),
        child: LayoutBuilder(
          builder: (context, constraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  widget.account.title,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                            child: Text(
                              "Inbox",
                              style: TextStyle(
                                  fontSize: 10.0
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: Colors.grey[300]
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon:  widget.account.starred ?
                            Icon(
                              Icons.star,
                              color: Colors.orange[300],
                            ): Icon(
                              Icons.star_border
                            ),
                            onPressed: (){
                              setState(() {
                                widget.account.starred = !widget.account.starred;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              widget.account.senderInfo.senderName[0],
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                            ),
                            radius: 25.0,
                          ),
                          const SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      widget.account.senderInfo.senderName,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'yesterday',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13.0
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                child: Row(
                                  children: [
                                    Text(
                                      "me",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                    RotationTransition(
                                      child: Icon(
                                          Icons.keyboard_arrow_down
                                      ),
                                      turns: arrowAnim,
                                    )
                                  ],
                                ),
                                onTap: (){
                                  setState(() {
                                    log("tap");
                                    isExpanded = !isExpanded;
                                  });

                                  isExpanded
                                      ? _arrowController.reverse()
                                      : _arrowController.forward();
                                },
                              )

                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.reply,
                              color: Colors.black54,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                      isExpanded
                          ? _infoBox()
                          : SizedBox(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        //"Starving, Omar chewed berries from nearby shrubbery but found them to be too bitter. He tried roasting the seeds to improve the flavor, but they became hard. He then tried boiling them to soften the seed, which resulted in a fragrant brown liquid. Upon drinking the liquid, Omar was revitalized and sustained for days. As stories of this \"miracle drug\" reached Mocha, Omar was asked to return and was made a saint.",
                        widget.account.content,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if(widget.account.attachedFile.isAttached) Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(5.0),
                        height: 185.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.insert_drive_file,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0) ,
                                    child: fileIcon(widget.account.attachedFile.fileType!),
                                  ),
                                  Text(
                                     widget.account.attachedFile.fileName!
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Icon(
                                      Icons.download,
                                      color: Colors.grey,
                                      size: 25.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Icon(
                                      Icons.drive_file_move,
                                      color: Colors.grey,
                                      size: 25.0,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          _buildButton(
                              buttonName: "Reply",
                              iconData: Icons.reply
                          ),
                          _buildButton(
                              buttonName: "Reply all",
                              iconData: Icons.reply_all
                          ),
                          _buildButton(
                              buttonName: "forward",
                              iconData: Icons.forward
                          )

                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              )
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildButton({
    required String buttonName,
    required IconData iconData
  }){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 50, 5, 15),
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                buttonName,
                style: TextStyle(
                    color: Colors.black54
                ),
              )
            ],
          ),
          style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                  color: Colors.grey[200]!
              )),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0)),
              overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.2))
          ),
          onPressed: (){

          },
        ),
      ),
    );
  }

  Widget _infoBox(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: double.infinity,
      //height: 200.0,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey[400]!
          ),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "From",
                style: TextStyle(
                    color: Colors.black54
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          widget.account.senderInfo.senderName
                      ),
                      Text(
                          "	• "
                      ),
                      Text(
                        widget.account.senderInfo.senderMail,
                        style: const TextStyle(
                            color: Colors.black54
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    "To",
                    style: TextStyle(
                        color: Colors.black54
                    ),),
                  const SizedBox(
                    width: 29.0,
                  ),
                  Text(
                    widget.account.senderInfo.senderName,
                    style: TextStyle(

                    ),
                  ),
                  Text(
                      "	• "
                  ),
                  Flexible(
                    child: Container(
                      child: Text(
                        widget.account.senderInfo.senderMail,
                        style: TextStyle(
                            color: Colors.black54
                        ),
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Text(
                "Date",
                style: TextStyle(
                    color: Colors.black54
                ),
              ),
              const SizedBox(
                width: 12.5,
              ),
              Text(
                  "19 Dec 2021"
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              const Icon(
                Icons.lock,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 21.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                      "Standard encryption"
                  ),
                  Text(
                    "see security details",
                    style: TextStyle(
                        color: Colors.blueAccent
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
