
// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';



class MainWidgetIconBtn extends StatelessWidget {
  MainWidgetIconBtn({Key? key, this.iconData, this.fontSize = 10,
    this.function,  this.isInitScreen = false, required this.title}) : super(key: key);


  List<IconData>? iconData;  final Function()? function;
  final bool isInitScreen; final String title;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    iconData ??= [Icons.remove, Icons.remove];
    return Expanded(
      child: Container(
        decoration:
        BoxDecoration(border: Border(
            top: isInitScreen?
            BorderSide(color: Theme.of(context).textSelectionTheme.selectionColor!, width: 2):
            const BorderSide(color: Colors.grey, width: 1)
        )),
        child: FlatButton(onPressed: function,
            child: Center(
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(bottom: 2)),
                  Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Icon(isInitScreen? iconData![1]: iconData![0], size: 22,
                          color: Theme.of(context).textSelectionTheme.selectionColor!)),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(title, style: TextStyle(fontSize:
                      fontSize, fontWeight: FontWeight.bold,
                          fontFamily: '',
                          color: Theme.of(context).textSelectionTheme.selectionColor!)))
                ],
              ),
            )),
      ),
    );
  }
}
