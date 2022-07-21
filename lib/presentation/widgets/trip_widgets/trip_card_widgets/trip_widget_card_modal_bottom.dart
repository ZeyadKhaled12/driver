
// ignore_for_file: deprecated_member_use

import 'package:driver/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';


class TripWidgetCardModalBottom extends StatelessWidget {
  const TripWidgetCardModalBottom({Key? key, required this.childImage,
    required this.childPlace, required this.childName,
    required this.schoolName, required this.parentUid}) : super(key: key);

  final String childName;
  final String childPlace;
  final String childImage;
  final String schoolName;
  final String parentUid;

  Widget _text({required IconData iconData, required BuildContext ctx,
    required String text}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(iconData, color: Theme.of(ctx).primaryColor, size: 20),
          const Padding(padding: EdgeInsets.only(right: 10)),
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 25,
              fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _text(iconData: Icons.person_outline, ctx: context, text: childName),
                  _text(iconData: Icons.location_on, ctx: context, text: childPlace),
                  _text(iconData: Icons.school, ctx: context, text: schoolName),
                ],
              ),
              CircleAvatar(
                radius: 54,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(childImage),
                ),
              ),
            ],
          ),
          FlatButton(onPressed: (){
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => ChatScreen(uidParent: parentUid)),
            );
          },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Chat with parent', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  Icon(Icons.chat, color: Theme.of(context).primaryColor)
                ],
              ))
        ],
      ),
    );
  }
}
