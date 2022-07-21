import 'package:flutter/material.dart';
class TextFieldDriver extends StatefulWidget {

  TextFieldDriver(
  {
     required this.hinttext,
     required this.iconData,
     required this.function,
     required this.textInputType,
     required this.validatior,
    required this.ontap,
}
      );
  final String hinttext;
  final IconData iconData;
  final TextEditingController function;
  final TextInputType textInputType;
  final Function validatior;
  Function ontap;
  @override
  _TextFieldDriverState createState() => _TextFieldDriverState();
}

class _TextFieldDriverState extends State<TextFieldDriver> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.function,
      keyboardType: widget.textInputType,
      validator: (s) {
        return widget.validatior(s);
      },
      onTap: () {
        widget.ontap;
      },
      decoration: InputDecoration(
        hintText: widget.hinttext,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),

        prefixIcon: Icon(
        widget.iconData,
        color: Color(0xFFFFAB4C),
      ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
