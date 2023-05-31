import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFrame extends StatelessWidget {

  final String comment;
  final TextOverflow? overflow;

  const TextFrame({
    super.key,
    required this.comment,
    this.overflow});

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    return Text(
      comment,
      style: TextStyle(
        fontSize: appHeight * 0.0168,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
