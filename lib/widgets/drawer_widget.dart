import 'dart:developer';

import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  int drawerIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Gmail",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: _buildItem(
                icon: Icons.all_inbox,
                itemName: "All inboxes",
                trailItem: null, index: 0,
                selectedTextColor: Colors.red,
                indicatorColor: Colors.red.withOpacity(0.1)
            ),
          ),
          const Divider(),
          _buildItem(
              icon: Icons.inbox,itemName: "Primary",
              trailItem: "6",
              index: 1,
              selectedTextColor: Colors.red,
              indicatorColor: Colors.red.withOpacity(0.1)
          ),
          _buildItem(
              icon: Icons.person_off_rounded,
              itemName: "Social",
              trailItem: "3",
              index: 2,
              selectedTextColor: Colors.blue,
              indicatorColor: Colors.blue.withOpacity(0.1),
              isSpecial: true
          ),
          _buildItem(
              icon: Icons.local_offer,
              itemName: "Promotions",
              trailItem: "18",
              index: 3,
              selectedTextColor: Colors.green,
              indicatorColor: Colors.green.withOpacity(0.1),
              isSpecial: true
          ),
          const SizedBox(height: 8.0,),
          _buildItemTitle(titleName: "ALL LABEL"),
          _buildItem(icon: Icons.star_border,itemName: "Starred", trailItem: "2", index: 4),
          _buildItem(icon: Icons.watch_later_outlined,itemName: "Snoozed", trailItem: null, index: 5),
          _buildItem(icon: Icons.label_important_outline,itemName: "Important", trailItem: "5", index: 6),
          _buildItem(icon: Icons.send_outlined,itemName: "Sent", trailItem: null, index: 7),
          _buildItem(icon: Icons.schedule_send_sharp,itemName: "Scheduled", trailItem: null, index: 8),
          _buildItem(icon: Icons.outbox_outlined,itemName: "Outbox", trailItem: null, index: 9),
          _buildItem(icon: Icons.description_outlined,itemName: "Drafts", trailItem: null, index: 10),
          _buildItem(icon: Icons.mail,itemName: "All mail", trailItem: null, index: 11),
          _buildItem(icon: Icons.warning_outlined,itemName: "Spam", trailItem: null, index: 12),
          _buildItem(icon: Icons.delete_outline,itemName: "Bin", trailItem: null, index: 13),
          _buildItem(icon: Icons.label_outline,itemName: "[Imap]/Trash", trailItem: null, index: 14),
          _buildItem(icon: Icons.label_outline,itemName: "Personal", trailItem: null, index: 15),
          _buildItem(icon: Icons.label_outline,itemName: "Receipts", trailItem: null, index: 16),
          _buildItem(icon: Icons.label_outline,itemName: "Work", trailItem: null, index: 17),
          const SizedBox(height: 8.0),
          _buildItemTitle(titleName: "GOOGLE APPS"),
          _buildItem(icon: Icons.calendar_today,itemName: "Calender", trailItem: null, index: 18),
          _buildItem(icon: Icons.contacts_rounded,itemName: "Contacts", trailItem: null, index: 19),
          const Divider(),
          _buildItem(icon: Icons.settings_outlined,itemName: "Settings", trailItem: null, index: 20),
          _buildItem(icon: Icons.help_outline,itemName: "Help and feedback", trailItem: null, index: 21),

        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String itemName,
    required String? trailItem,
    Color? selectedTextColor,
    Color? indicatorColor,
    required int index,
    bool? isSpecial = false
  }){
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 5.0, right: 20.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            drawerIndex = index;
          });
          //log(drawerIndex.toString());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Row(
            children: [
              Icon(
                  icon,
                  color: index == drawerIndex
                      ? (selectedTextColor != null && indicatorColor != null)
                      ? selectedTextColor : Colors.red[400] : Colors.black54
              ),
              const SizedBox(
                width: 18.0,
              ),
              Text(
                itemName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: index == drawerIndex
                        ? (selectedTextColor != null && indicatorColor != null)
                        ? selectedTextColor : Colors.red[400] : Colors.black54
                ),
              ),
              const Spacer(),
              (trailItem != null && isSpecial == false)
                  ? Text("$trailItem+")
                  : (trailItem != null && isSpecial == true)
                    ? Container(
                        height: 10.0,
                        width: 15.0,
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "$trailItem new"
                        ),
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                    ): Text(""),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
            color: index == drawerIndex ?
            (selectedTextColor != null && indicatorColor != null)
                ? indicatorColor : Colors.grey[300] : Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildItemTitle({
    required String titleName,
  }){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 10.0),
      child: Text(
        titleName,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            color: Colors.black54
        ),
      ),
    );
  }
}

