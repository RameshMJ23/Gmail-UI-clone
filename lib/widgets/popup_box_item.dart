import 'package:flutter/material.dart';

Widget popupBoxItem({
  required String accountName,
  required String mail,
  required String unSeen
}){
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: CircleAvatar(
            child: Text(accountName[0]),
            radius: 15.0,
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.5),
          //color: Colors.green,
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                accountName,
                style: const TextStyle(
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
                    mail,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 11.0
                    ),
                  ),
                  const Spacer(),
                  Text(
                    unSeen,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 11.0
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 3.0,
              ),
            ],
          ),
        ),
      )
    ],
  );
}


Widget popupBoxBottom(
  {
    required String itemName,
    required IconData iconData
  }
){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Icon(
              iconData,
              size: 23.0,
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          itemName,
          style:  const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    ),
  );
}