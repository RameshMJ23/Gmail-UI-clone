import 'package:flutter/material.dart';


class DefaultDrawerRoute extends StatelessWidget {

  String routeName;
  String? image;

  DefaultDrawerRoute({
    required this.routeName,
    this.image = "assets/folder.jpeg"
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset(
                image!
            ),
            Text(
              "Nothing in $routeName",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54
              ),
            )
          ],
        )
      ),
    );
  }
}
