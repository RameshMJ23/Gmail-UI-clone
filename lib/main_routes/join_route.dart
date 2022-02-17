
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinRoute extends StatefulWidget {
  @override
  _JoinRouteState createState() => _JoinRouteState();
}

class _JoinRouteState extends State<JoinRoute> {

  bool textEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Join with a code",
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black38,
          ),
          onPressed: (){
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            child: Text(
              "Join",
              style: TextStyle(
                color: textEntered ? Colors.blueAccent : Colors.grey
              ),
            ),
            onPressed: textEntered ? (){} : null,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Enter the code provided by the meeting ",
                  style: TextStyle(
                      fontSize: 15.0,
                      wordSpacing: 3.5
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "organiser",
                  style: TextStyle(
                      fontSize: 15.0,
                      wordSpacing: 5.0
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                hintText: "Example: abc-mnop-xyz",
                fillColor: Colors.grey[200]!,
                filled: true,
                //enabled: false,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (val){
                setState(() {
                  val.isNotEmpty ? textEntered = true : textEntered = false;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}


///https://stackoverflow.com/a/62319859/14555109
///git hub auth problem
