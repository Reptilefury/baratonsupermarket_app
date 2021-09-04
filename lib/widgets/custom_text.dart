import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  //text= string , Double size , Color ,Fontweight weight

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText({Key key, this.weight, this.color, this.text, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
