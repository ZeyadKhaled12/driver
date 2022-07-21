

import 'package:flutter/material.dart';

import 'main_widget_icon_btn.dart';


class MainWidgetBottomBar extends StatelessWidget {

  const MainWidgetBottomBar({Key? key, required this.iconsData,
    required this.iconsTitles, required this.initScreen,
    required this.function}) : super(key: key);

  final List<List<IconData>> iconsData;
  final List<String> iconsTitles;
  final Function(int initState) function;
  final int initScreen;



  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 50,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconsTitles.length, (index) =>
              MainWidgetIconBtn(iconData: iconsData[index],
                title: iconsTitles[index],
                isInitScreen: initScreen == index? true:false,
                function: () => function(index),
              ),
          )
      ),
    );
  }
}