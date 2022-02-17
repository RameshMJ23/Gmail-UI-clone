import 'package:flutter/material.dart';
import 'package:gmailclone/widgets/popup_box_item.dart';

Widget popupDialogBox(
 BuildContext context
){
  return Dialog(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0)
      ),
      //height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Row(
              children: [
                GestureDetector(
                    child: Icon(Icons.close),
                    onTap: (){
                      Navigator.pop(context);
                    }
                ),
                const SizedBox(
                  width: 85.0,
                ),
                RichText(
                  text: const TextSpan(
                      text: "G",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700
                      ),
                      children: [
                        TextSpan(
                            text: "o",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                        TextSpan(
                            text: "o",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                        TextSpan(
                            text: "g",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                        TextSpan(
                            text: "l",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                        TextSpan(
                            text: "e",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            //height: 70,
            width: double.infinity,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        child: Text("R"),
                        backgroundColor: Colors.blue,
                        radius: 20.0,
                      ),
                      Positioned(
                        bottom: -6.5,
                        right: -6.5,
                        child: Container(
                          height: 27.0,
                          width: 27.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.grey[300]!
                                  ),
                                  color: Colors.white
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black87,
                                  size: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    clipBehavior: Clip.none,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    //height: double.infinity,
                    //color: Colors.yellow,
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ram",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.0
                          ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "ram@gmail.com",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 11.0
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "4+",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 11.0
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                            child: Text(
                              "Google Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.0,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          //width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              border: Border.all(
                                  color: Colors.grey[400]!
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          popupBoxItem(
              accountName: "Julius",
              mail: "julius@gmail.com",
              unSeen: "6+"
          ),
          popupBoxItem(
              accountName: "Pakshi",
              mail: "pakshi@gmail.com",
              unSeen: "8+"
          ),
          popupBoxBottom(
              itemName: "Add another account",
              iconData: Icons.person_add_alt_outlined
          ),
          popupBoxBottom(
              itemName: "Manage accounts ",
              iconData: Icons.settings_outlined
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Privacy policy",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "•",
                    style: TextStyle(
                        color: Colors.grey[700]
                    ),
                  ),
                ),
                Text(
                  "Terms of service",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}