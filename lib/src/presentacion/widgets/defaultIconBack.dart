import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultIconBack extends StatelessWidget {
  double left;
  double top;
  Color color;
  DefaultIconBack({required this.left, required this.top, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: left, top: top),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: color,
          )),
    );
  }
}
