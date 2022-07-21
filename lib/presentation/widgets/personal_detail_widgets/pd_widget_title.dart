import 'package:flutter/material.dart';




class PdWidgetTitle extends StatelessWidget {
  const PdWidgetTitle({Key? key, required this.title, required this.data,
    required this.iconData, this.imageUrl}) : super(key: key);
  final String title;
  final String data;
  final IconData iconData;
  final String ?imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 24, color: Colors.black)),
            Icon(iconData, color: Theme.of(context).primaryColor, size: 28)
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        imageUrl == null?
        Text(data, style: const TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold, color: Colors.grey)):
        Image(image: NetworkImage(imageUrl!)),
      ],
    );
  }
}
