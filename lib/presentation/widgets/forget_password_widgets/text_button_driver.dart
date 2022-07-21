import 'package:flutter/material.dart';
class TextButtonDriver extends StatefulWidget {
  TextButtonDriver({Key? key,
    required this.text,
    required this.sizeText,
    required this.colorText,
    required this.onPressed,
    this.decoration,
}) : super(key: key);

final String text;
final double sizeText;
final Color colorText;
final Function onPressed;
TextDecoration? decoration;

  @override
  _TextButtonDriverState createState() => _TextButtonDriverState();
}

class _TextButtonDriverState extends State<TextButtonDriver> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,

      child: TextButton(
        child: Text(
          '$widget.text',
          style: TextStyle(
            fontFamily: 'SourceSansPro-SemiBold',
            fontSize: widget.sizeText,
            color: widget.colorText,
            decoration: widget.decoration,

            //TextDecoration.underline,
          ),
        ),
        onPressed: (){
          widget.onPressed();
        },
      ),
    );
  }
}
