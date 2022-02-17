import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gmailclone/main_routes/join_route.dart';
import 'package:gmailclone/widgets/acc_icon.dart';
import 'package:gmailclone/widgets/dialog_box.dart';
import 'package:gmailclone/widgets/meet_carousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MeetRoute extends StatefulWidget {
  @override
  _MeetRouteState createState() => _MeetRouteState();
}

class _MeetRouteState extends State<MeetRoute> {

  /// Replace app bar with normal widget to give appropriate
  /// spacing for the account icon
  ///
  int activeIndex = 0;

  List<String> imageUrl = [
    "assets/gmail1.jpeg",
    "assets/gmail2.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: (){
                       Scaffold.of(context).openDrawer();
                    },
                  ),
                  const Spacer(),
                  const Text(
                    "Meet",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const Spacer(),
                  GmailAnim(
                    onTapFunc: onTapIcon,
                    swipeFunction: (){

                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: buildButton(
                      buttonName: "New meeting",
                      textColor: Colors.white,
                      buttonColor: Colors.blue,
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (context){
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildSheetItem(Icons.link, "Get a meeting link to share"),
                                buildSheetItem(Icons.video_call_sharp, "Start an instant meeting"),
                                buildSheetItem(Icons.calendar_today, "Schedule in Google Calender"),
                                buildSheetItem(Icons.close, "Close"),
                              ]
                            );
                          }
                        );
                      }
                    ),
                  ),
                  Expanded(
                    child: buildButton(
                      buttonName: "Join with a code",
                      textColor: Colors.blue,
                      buttonColor: Colors.white,
                      borderColor: Colors.grey[400],
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => JoinRoute()));
                      }
                    ),
                  )
                ],
            ),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: imageUrl.length,
                itemBuilder: (context, index, realIndex){
                  return Center(
                    child: items[index],
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: double.infinity,
                  onPageChanged: (index, _){
                    setState(() {
                      activeIndex = index;
                    });
                  }
                )
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: buildIndicator(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheetItem(
    IconData iconData,
    String content
  ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black87,
            size: 20.0,
          ),
          const SizedBox(width: 15.0,),
          Text(
            content,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          )
        ],
      ),
    );
  }

  Widget buildIndicator(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: AnimatedSmoothIndicator(
        count: items.length,
        activeIndex: activeIndex,
        effect: WormEffect(
          dotHeight: 9.0,
          dotWidth: 9.0,
          activeDotColor: Colors.blueAccent,
          dotColor: Colors.grey[400]!
        ),
      ),
    );
  }

  Widget buildButton({
    required String buttonName,
    required Color textColor,
    required buttonColor,
    Color? borderColor,
    required VoidCallback onPressed
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: GestureDetector(
        child: Container(
          child: Text(
            buttonName,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: buttonColor,
              border: borderColor != null
                  ? Border.all(color: borderColor): Border.all(color: Colors.transparent)
          ),
        ),
        onTap: onPressed,
      ),
    );
  }

  onTapIcon(){
    return showDialog(
      context: context,
      builder: (context){
        return popupDialogBox(context);
      }
    );
  }

  List<Widget> items = [
    meetCarousel(
      imageUrl: "assets/gmail1.jpeg",
      textColumn: Column(
        children: const [
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Your meeting is safe",
            style: TextStyle(
              fontSize: 22.0
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "No one can join the meeting unless",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey
            ),
          ),
          Text(
            "invited or admitted by the host",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey
            ),
          )
        ],
      )
    ),
    meetCarousel(
      imageUrl: "assets/gmail2.jpeg",
      textColumn: Column(
        children: [
          const Text(
            "Get a link that you can",
            style: TextStyle(
              fontSize: 22.0
            ),
          ),
          const Text(
              " share",
              style: TextStyle(
                  fontSize: 22.0
              )
          ),
          const SizedBox(
            height: 5.0,
          ),
          RichText(
            text: const TextSpan(
              text: "Tap ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.5
              ),
              children: [
                TextSpan(
                    text: "New meeting ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17.5,
                        color: Colors.grey
                    )
                ),
                TextSpan(
                    text: "to get a link that ",
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey
                    )
                )
              ]
            ),
          ),

          const Text(
              "you can send to people that you",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey
              )
          ),
          const Text(
              " want to meet with",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey
              )
          )
        ],
      )
    )
  ];
}