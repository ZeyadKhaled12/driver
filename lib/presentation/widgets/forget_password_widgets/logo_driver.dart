import 'package:flutter/material.dart';

class LogoDriver extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topEnd,
      child: Image(
        image:AssetImage('assets/images/bus logo.png'),
        height: 150,
        width: 120,
      ),
    );
  }
}
