import 'package:flutter/material.dart';


class ComposeRoute extends StatefulWidget {
  @override
  _ComposeRouteState createState() => _ComposeRouteState();
}

class _ComposeRouteState extends State<ComposeRoute> {

  List<String> menuOptions = [
    "Schedule send",
    "Add from Contacts",
    "Confidential mode",
    "Save draft",
    "Discard",
    "Settings",
    "Help and feedback"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 10.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Compose",
          style: TextStyle(
            color: Colors.black54
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: (){
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
        ),
        actions: [
          RotatedBox(
            child: IconButton(
             icon: const Icon(Icons.attach_file),
              color: Colors.black54,
              onPressed: (){},
            ),
            quarterTurns: 1,
          ),
          IconButton(
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black54,
            ),
            onPressed: (){

            },
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
            padding: const EdgeInsets.all(0.0),
            itemBuilder: (context){
              return menuOptions.map((String option){
                return PopupMenuItem(
                  child: Text(option.toString()),
                  value: option,
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Row(
              children: const [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "From",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.5
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "rameshkrsihsdaf@gmail.com",
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Icon(
                    Icons.keyboard_arrow_down
                ),
                SizedBox(
                  width: 8.0,
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: const [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "To",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      contentPadding: EdgeInsets.all(2.0)
                    ),
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                    cursorHeight: 30.0,
                  ),
                ),
                Icon(
                    Icons.keyboard_arrow_down
                ),
                SizedBox(
                  width: 8.0,
                )
              ],
            ),
          ),
          const Divider(),
          const TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: "Subject",
              hintStyle: TextStyle(
                fontSize: 16.0
              ),
              contentPadding: EdgeInsets.only(
                top: 6.0,
                bottom: 6.0,
                left: 10.0,
                right: 8.0
              ),
            ),
            cursorHeight: 25.0,
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
          const Divider(),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
              maxLines: null,
              expands: true,
              style: TextStyle(
                fontSize: 20.0
              ),
              cursorHeight: 30.0,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    FocusScope.of(context).unfocus();
  }


}
