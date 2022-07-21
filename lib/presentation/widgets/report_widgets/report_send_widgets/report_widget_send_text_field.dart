
import 'package:flutter/material.dart';


class  ReportWidgetSendTextField extends StatelessWidget {
  const ReportWidgetSendTextField({Key? key, required this.controller, this.enabled = true}) : super(key: key);
  final TextEditingController controller;
  final bool enabled;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 5,
      maxLength: 50,
      enabled: enabled,

      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 9),
          labelText:'Notes',
          counterText: '',
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6)),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.4), width: 0),
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,
                  width: 0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,
                  width: 0))


      ),
    );
  }
}
