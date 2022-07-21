
import 'package:driver/presentation/screens/trip_screen.dart';
import 'package:flutter/material.dart';


import '../../../screens/personal_detail_screen.dart';
import '../../../screens/report_send_screen.dart';
import '../../general_widgets/general_widget_circular.dart';
import 'main_widget_bottom_bar.dart';




class MainWidgetBottom extends StatefulWidget {
  const MainWidgetBottom({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  _MainWidgetBottomState createState() => _MainWidgetBottomState();
}

class _MainWidgetBottomState extends State<MainWidgetBottom> {

  final List<List<IconData>> _iconsData = [
    [Icons.child_care_outlined, Icons.child_care],
    [Icons.date_range_outlined, Icons.date_range],
    [Icons.report_problem_outlined, Icons.report_problem]];

  final List _screens = const [TripScreen(), PersonalDetailScreen(),
    ReportSendScreen()];

  int _initScreen = 0;

  final List<String> _iconsTitles = [
    'Trip',
    'Profile',
    'report'
  ];

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 49),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _screens[_initScreen],
          ),
        ),
        MainWidgetBottomBar(iconsData: _iconsData,
            iconsTitles: _iconsTitles, initScreen: _initScreen,
            function: (int index) {setState(() {_initScreen = index;});}),
        if(widget.isLoading)
          const Center(child: GeneralWidgetCircular(color: Colors.white))
      ],
    );
  }
}
