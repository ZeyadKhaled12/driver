// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class GeneralWidgetCircular extends StatefulWidget {
  const GeneralWidgetCircular({Key? key, required this.color}) : super(key: key);
  final Color color;


  @override
  _GeneralWidgetCircularState createState() => _GeneralWidgetCircularState();
}

class _GeneralWidgetCircularState extends State<GeneralWidgetCircular> {




  List<double> _listPuppets = [3,3, 8];
  Widget _puppets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: _listPuppets[2],
          backgroundColor: Colors.white,
        ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        CircleAvatar(
          radius: _listPuppets[1],
          backgroundColor: Colors.white,
        ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        CircleAvatar(
          radius: _listPuppets[0],
          backgroundColor: Colors.white,
        )
      ],
    );
  }

  Future _initState() async{
    while(true) {
      await Future.delayed(const Duration(milliseconds: 250)).then((value) {
        if(_listPuppets[2] == 8){
          setState(() {
            _listPuppets = [8, 3, 3];
          });
        }
        else if(_listPuppets[0] == 8){
          setState(() {
            _listPuppets = [3, 8, 3];
          });
        }
        else{
          setState(() {
            _listPuppets = [3, 3, 8];
          });
        }
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: widget.color.withOpacity(0.8),
      ),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                  height: 80,
                  width: 80,
                  image: AssetImage('assets/images/logo.png')),
              SizedBox(width: 60,
                  height: 20,
                  child: _puppets())
            ],
          )
      ),
    );
  }
}
