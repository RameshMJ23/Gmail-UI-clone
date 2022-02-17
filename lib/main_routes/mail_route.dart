

import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:gmailclone/bloc/cubit.dart';
import 'package:gmailclone/bloc/state.dart';
import 'package:gmailclone/data/acc_info.dart';
import 'package:gmailclone/data/account_1.dart';
import 'package:gmailclone/data/account_2.dart';
import 'package:gmailclone/main_routes/compose_route.dart';
import 'package:gmailclone/main_routes/pop_route.dart';
import 'package:gmailclone/main_routes/serach_route.dart';

import 'package:gmailclone/model/acc_details.dart';
import 'package:gmailclone/widgets/acc_icon.dart';
import 'package:gmailclone/widgets/dialog_box.dart';
import 'package:gmailclone/widgets/mail_list_widget.dart';
import 'package:gmailclone/widgets/popup_box_item.dart';
import 'package:rive/rive.dart';
import 'package:gmailclone/model/mail_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MailRoute extends StatefulWidget {
  
  @override
  _MailRouteState createState() => _MailRouteState();
}

class _MailRouteState extends State<MailRoute> with TickerProviderStateMixin{

  bool starred = false;
  late AnimationController controller;
  late Animation colorAnim;
  late ScrollController _scrollController;
  bool isExtended = false;
  double fabWidth = 52;
  late double startOffset;
  int riveAnimVal1 = 1;
  int riveAnimVal2 = 1;
  bool isFront = true;
  static List<MailModel> presentAccount = account1_mail_data;
  bool onSearchTap = false;
  bool mailSelected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 900)
    );

    colorAnim = ColorTween(
      begin: Colors.green,
      end: Colors.red
    ).animate(controller);

    controller.addStatusListener((status) {

      log("circle Avatar animatinggg");
      if(status == AnimationStatus.completed){
        controller.reset();
      }
    });

    _scrollController.addListener(() {
      if(_scrollController.position.userScrollDirection == ScrollDirection.forward){
          setState(() {
              isExtended = true;
              fabWidth = 145;
          });
      }
      if(_scrollController.position.userScrollDirection == ScrollDirection.reverse){
        setState(() {
          isExtended = false;
          fabWidth = 52;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AccountCubit, AccountDetail>(
      builder: (context, state){
        return AnimatedBuilder(
            animation: controller,
            builder: (context, child){
              return SafeArea(
                  child: Scaffold(
                    body: RefreshIndicator(
                      displacement: 65.0,
                      onRefresh: onRefresh,
                      color: colorAnim.value,
                      child: CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverStack(
                            insetOnOverlap: true,
                            children: [
                              SliverPadding(
                                padding: EdgeInsets.only(top: 75),
                                sliver: SliverToBoxAdapter(
                                    child: _buildItemTitle(titleName: "PRIMARY")
                                ),
                              ),
                              displayContent(state: state),
                              showAppBar(state: state)
                            ],
                          )
                        ],
                      ),
                    ),
                    floatingActionButton: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: fabWidth,
                      height: 52.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4.0,
                                offset: Offset(
                                    0, 3
                                )
                            )
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: isExtended
                            ? Material(
                          borderRadius: BorderRadius.circular(50.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ComposeRoute()));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: const [
                                Positioned(
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.red,
                                  ),
                                  left: 15.0,
                                ),
                                Positioned(
                                  left: 50.0,
                                  child: Center(
                                    child: Text(
                                      "Compose",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              clipBehavior: Clip.hardEdge,
                            ),
                            highlightColor: Colors.red.withOpacity(0.15),
                          ),
                        ): Material(
                          borderRadius: BorderRadius.circular(50.0),
                          child: InkWell(
                            highlightColor: Colors.red.withOpacity(0.15),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ComposeRoute()));
                            },
                            child: const Icon(
                              Icons.edit_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

              );
            }
        );
      },
    );
  }

  Widget showAppBar({required AccountDetail state}){
    if(state is AccountSelected){
      return selectedAppBar(state.numOfItems.toString());
    }else{
      return normalAppBar();
    }
  }

  Widget _buildItemTitle({
    required String titleName,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Text(
        titleName,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            color: Colors.black54,
          letterSpacing: 3.0
        ),
      ),
    );
  }

  Future<void> onRefresh(){
    controller.forward();
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  showDialogBox(){
    final alertBox =  popupDialogBox(context);

    showDialog(
      context: context,
      builder: (context){
        return alertBox;
      }
    );
  }

  Widget popupBottom({required IconData data, required String itemName}){
    return GestureDetector(
      child: Container(
        height: 20.0,
        child: Row(
          children: [
            Icon(
                data
            ),
            Text(
              itemName,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }

   changeAccount(){
    BlocProvider.of<AccountCubit>(context).changeAccount();
  }


  changeAppBar(){
    setState(() {
      mailSelected = false;
    });
  }

  Widget displayContent({required AccountDetail state}){
    if(state is InitialAccount){
      return listBuilderWidget(state.account);
    }else if(state is StarredAccount){
      return listBuilderWidget(state.starredAccount);
    } else if(state is AccountSelected){
      return listBuilderWidget(state.account);
    }else if(state is NoAccountSelected){
      return listBuilderWidget(state.account);
    }else if(state is AccountChanged){
      return listBuilderWidget(state.account);
    }else{
      return SliverPositioned(
        top: MediaQuery.of(context).size.height / 2,
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget listBuilderWidget(List<MailModel> listAccount){
    return SliverPadding(
      padding: EdgeInsets.only(top: 110.0),
      sliver : SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index){
              final account = listAccount[index];
              return MailList(
                key: UniqueKey(),
                index: index,
                account: account,
                changeAppBar: changeAppBar,
              );
            },
            childCount: account1_mail_data.length
        ),
      ),
    );
  }

  Widget normalAppBar(){
    return SliverPadding(
        padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0
        ),
        sliver: SliverAppBar(
          expandedHeight: onSearchTap ? 200.0 : 0,
          backgroundColor: Colors.white,
          pinned: false,
          floating: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          shadowColor: Colors.grey,
          elevation: 0.5,
          forceElevated: true,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(9.0),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                    color: Colors.grey[300]!
                )
            ),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                            Icons.menu
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Hero(
                              tag: "searchfield",
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Search in emails",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[500],
                                      fontSize: 17.0,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GmailAnim(
                    onTapFunc: showDialogBox,
                    swipeFunction: changeAccount,
                  )
                ],
              ),
              onTap: (){
                log("tapped serach");
              },
            ),
          ),
        )
    );
  }

  Widget selectedAppBar(String numOfItems){
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        numOfItems,
        style: TextStyle(
            color: Colors.black
        ),
      ),
      leading: const Icon(
        Icons.arrow_back,
        color: Colors.black,
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
    );
  }

}


