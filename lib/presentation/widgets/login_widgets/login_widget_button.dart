// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';



class LoginWidgetButton extends StatelessWidget {
  LoginWidgetButton({Key? key, required this.function}) : super(key: key);
  Function() function;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey, width: 1)
      ),
      child: FlatButton(
          onPressed: function,
          child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              color: Colors.white
          ))),
    );
  }
}
