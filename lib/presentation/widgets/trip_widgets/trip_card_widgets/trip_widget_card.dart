
// ignore_for_file: prefer_typing_uninitialized_variables

import 'trip_widget_card_child_pic.dart';
import 'package:flutter/material.dart';



class TripWidgetCard extends StatelessWidget {
  const TripWidgetCard({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor)
      ),

      child: Wrap(
        children: List.generate(data.length,
                (index) => TripWidgetCardChildPic(
                    schoolName: data[index]['school_name'],
                    childImage: data[index]['profile_pic'],
                    childName: data[index]['name'],
                    childPlace: data[index]['address'],
                    parentUid: data[index]['parent_uid']
                )
        )
      ),
    );
  }
}
