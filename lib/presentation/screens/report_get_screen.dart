
import 'package:driver/presentation/widgets/general_widgets/general_app_bar_widgets/general_widget_app_bar.dart';
import 'package:driver/presentation/widgets/report_widgets/report_get_widgets/report_widget_get_stream.dart';

import 'package:flutter/material.dart';


class ReportGetScreen extends StatefulWidget {
  const ReportGetScreen({Key? key}) : super(key: key);
  static String route = 'ReportGetScreenRoute';

  @override
  _ReportGetScreenState createState() => _ReportGetScreenState();
}

class _ReportGetScreenState extends State<ReportGetScreen> {

  @override
  Widget build(BuildContext context) {
    return const GeneralWidgetAppBar(title: 'Report board',
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: ReportWidgetGetStream()
          ),
        ));
  }
}
