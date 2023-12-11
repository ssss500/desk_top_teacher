import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text ;
  dynamic fontFamily;

  final double fontSize;

  final Color color;

  final Alignment alignment;
  var textDirection, softWrap;
  final TextOverflow textOverflow;

  final maxLine;
  final double height;
  final FontWeight fontWeight;

  CustomText(
    this.text, {
    this.fontSize = 16,
    this.softWrap = true,
    this.textOverflow = TextOverflow.visible,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.textDirection = TextDirection.rtl,
    this.maxLine,
    this.height = 1,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        textAlign: TextAlign.center,
        textDirection: textDirection,
        overflow: textOverflow,
        softWrap: softWrap,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,

          fontFamily: fontFamily,
          height: height,
          fontSize: fontSize,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
