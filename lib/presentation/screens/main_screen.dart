
import 'package:flutter/material.dart';

import '../widgets/main_widgets/main_widget_bottom/main_widget_bottom.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {
    return MainWidgetBottom(isLoading: _isLoading);
  }
}
