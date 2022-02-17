import 'package:flutter/material.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 85.0,
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Row(
                children:  [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                        Icons.arrow_back
                    ),
                  ),
                  Expanded(
                      child: Hero(
                          tag: "searchfield",
                          child: Card(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search in mails",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500],
                                    fontSize: 17.0
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                disabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                              ),
                            ),
                            color: Colors.white,
                            elevation: 0.0,
                            borderOnForeground: false,
                          )
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                        Icons.mic
                    ),
                  ),
                  Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

