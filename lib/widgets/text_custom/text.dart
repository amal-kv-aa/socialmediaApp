import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final String ? fontfamily;
  const CustomText(
      {Key? key, required this.text, this.color, this.weight, this.size, this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color ?? Colors.black,
            fontSize: size ?? 16,
            fontWeight: weight ?? FontWeight.normal,fontFamily: fontfamily ));
  }
}

