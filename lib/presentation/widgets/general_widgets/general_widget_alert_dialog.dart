// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';




class GeneralWidgetAlertDialog extends StatelessWidget {
  const GeneralWidgetAlertDialog({Key? key, required this.text}) : super(key: key);


  final String text;


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 19,
          fontWeight: FontWeight.bold)),
      content: SizedBox(
        height: 80,
        child: Column(
          children: <Widget>[
            const Divider(color: Colors.white),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white,
                child: Text(
                    'OK', style: TextStyle(color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            )
          ],
        ),
      ),
    );

  }
}