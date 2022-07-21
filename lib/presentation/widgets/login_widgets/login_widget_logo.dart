import 'package:flutter/material.dart';


class LoginWidgetLogo extends StatelessWidget {
  const LoginWidgetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                Image(image: AssetImage('assets/images/logo.png'),height: 180, width: 180)]),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[Text('Hello!', style:
                      TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Please sign in', style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
                      ])
                ]),
          ),

        ],
      ),
    );
  }
}
