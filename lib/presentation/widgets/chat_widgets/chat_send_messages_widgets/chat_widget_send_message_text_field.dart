
import 'package:flutter/material.dart';



class ChatWidgetSendMessageTextField extends StatelessWidget {
  const ChatWidgetSendMessageTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(14),
              hintText:'Type your message',
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
