
import 'package:flutter/material.dart';



class ReportWidgetGetListTitle extends StatelessWidget {
  const ReportWidgetGetListTitle({Key? key, required this.title,
    required this.iconData}) : super(key: key);
  final String title;
  final IconData iconData;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.black, fontSize: 20,
        fontWeight: FontWeight.bold)),
      trailing: Icon(iconData, size: 25, color: Theme.of(context).primaryColor),
    );
  }
}
