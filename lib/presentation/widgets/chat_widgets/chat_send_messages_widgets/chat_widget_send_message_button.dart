
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';



class ChatWidgetSendMessageButton extends StatelessWidget {
  const ChatWidgetSendMessageButton({Key? key, required this.function}) : super(key: key);
  final Function() function;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        child: FlatButton(onPressed: function, child: const Text('Send', style: TextStyle(
          color: Colors.white, fontSize: 18
        ))),
      ),
    );
  }
}
