
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatWidgetMsg extends StatelessWidget {
  const ChatWidgetMsg({Key? key, required this.msg, required this.isCurrentUser}) : super(key: key);
  final String msg;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {

    Color color = isCurrentUser?Theme.of(context).primaryColor:Colors.black;
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isCurrentUser?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(isCurrentUser?20:0),
                bottomLeft: Radius.circular(isCurrentUser?0: 20),
                topRight: const Radius.circular(20),
                topLeft: const Radius.circular(20),
              ),
              border: Border.all(color: color),
              color: Colors.white,
            ),
            child: Text(msg, style: TextStyle(color: color,
                fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start),
          ),
        ],
      ),
    );
  }
}
