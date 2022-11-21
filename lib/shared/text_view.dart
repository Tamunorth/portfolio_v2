import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final GlobalKey? textKey;
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double size;
  final double? lineHeight;
  final FontWeight? weight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDecoration? decoration;

  TextView({
    this.textKey,
    required this.text,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.onTap,
    this.size = 14.0,
    this.lineHeight,
    this.textStyle,
    this.maxLines,
    this.weight = FontWeight.normal,
    this.decoration,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        key: textKey,
        style: textStyle ??
            GoogleFonts.openSans(
                color: color,
                decoration: decoration,
                fontWeight: weight,
                fontSize: size,
                fontStyle: fontStyle,
                height: lineHeight),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}

class TextViewAlt extends StatelessWidget {
  final GlobalKey? textKey;
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double size;
  final double? lineHeight;
  final FontWeight? weight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDecoration? decoration;

  TextViewAlt({
    this.textKey,
    required this.text,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.onTap,
    this.size = 14.0,
    this.lineHeight,
    this.textStyle,
    this.maxLines,
    this.weight = FontWeight.normal,
    this.decoration,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        key: textKey,
        style: TextStyle(
              fontFamily: 'Clash',
              color: color,
              decoration: decoration,
              fontWeight: weight,
              fontSize: size,
              fontStyle: fontStyle,
              height: lineHeight,
            ) ??
            GoogleFonts.playfairDisplay(
                color: color,
                decoration: decoration,
                fontWeight: weight,
                fontSize: size,
                fontStyle: fontStyle,
                height: lineHeight),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
