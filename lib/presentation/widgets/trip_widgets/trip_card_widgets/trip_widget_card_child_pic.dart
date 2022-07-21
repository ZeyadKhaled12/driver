
import 'package:driver/presentation/widgets/trip_widgets/trip_card_widgets/trip_widget_card_modal_bottom.dart';
import 'package:flutter/material.dart';



class TripWidgetCardChildPic extends StatelessWidget {
  const TripWidgetCardChildPic({Key? key, required this.childImage,
    required this.childName, required this.childPlace,
    required this.schoolName, required this.parentUid}) : super(key: key);

  final String childName;
  final String childPlace;
  final String childImage;
  final String schoolName;
  final String parentUid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: InkWell(
        onTap: (){
          showModalBottomSheet(context: context, builder: (ctx){
            return TripWidgetCardModalBottom(childImage: childImage, childPlace:
            childPlace, childName: childName, schoolName: schoolName, parentUid: parentUid);
          }, shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft:  Radius.circular(20), topRight:
            Radius.circular(20)),
          ), clipBehavior: Clip.antiAliasWithSaveLayer,
              isScrollControlled: false
          );
        },
        child: CircleAvatar(
          radius: 38,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(childImage),
          ),
        ),
      )
    );
  }
}
