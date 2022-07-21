
import 'package:driver/presentation/widgets/report_widgets/report_get_widgets/report_widget_get_list_tile.dart';
import 'package:flutter/material.dart';



class ReportWidgetGetCard extends StatelessWidget {
  const ReportWidgetGetCard({Key? key, required this.name, required this.childrenNum,
    required this.area, required this.imageUrl,
    required this.mobile, required this.notes}) : super(key: key);
  final String name;
  final String area;
  final String imageUrl;
  final int childrenNum;
  final String mobile;
  final String notes;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CircleAvatar(
               radius: 42.9,
               backgroundColor: Theme.of(context).primaryColor,
               child: CircleAvatar(
                 radius: 40,
                 backgroundImage: NetworkImage(imageUrl),
               ),
             ),
              ReportWidgetGetListTitle(title: name, iconData: Icons.person),
              ReportWidgetGetListTitle(title: '$childrenNum', iconData: Icons.child_friendly),
              ReportWidgetGetListTitle(title: area, iconData: Icons.person),
              ReportWidgetGetListTitle(title: mobile, iconData: Icons.mobile_friendly),
              if(notes.isNotEmpty)
                ReportWidgetGetListTitle(title: notes, iconData: Icons.note),
            ],
          ),
        ),
      ),
    );
  }
}
