import 'package:flutter/material.dart';


Widget meetCarousel({
    required String imageUrl,
    required Column textColumn
  }){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            imageUrl,
          ),
          height: 210.0,
        ),
        const SizedBox(
          height: 5.0,
        ),
        textColumn
      ],
    ),
  );
}