
// ignore_for_file: deprecated_member_use


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';
import '../widgets/general_widgets/general_app_bar_widgets/general_widget_app_bar.dart';

import '../widgets/trip_widgets/trip_card_widgets/trip_widget_card.dart';
import 'package:flutter/material.dart';




class TripScreen extends StatefulWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {


  @override
  Widget build(BuildContext context) {
    return  GeneralWidgetAppBar(title: 'Trip',
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: StreamBuilder<QuerySnapshot>(

                  stream: FirebaseFirestore.instance.collection('children').snapshots(),

                  builder: (ctx, snapShot){

                    if(snapShot.connectionState == ConnectionState.waiting){
                      return Center(child:CircularProgressIndicator(valueColor:
                      AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
                    }

                    return Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TripWidgetCard(data: snapShot.data?.docs.toList()),
                        FlatButton(onPressed: () async{
                          LocationData _location = await Location().getLocation();
                          await FirebaseFirestore.instance.collection('drivers').doc(
                            FirebaseAuth.instance.currentUser?.uid).update({
                            'latitude': '${_location.latitude}',
                            'longitude': '${_location.longitude}'});},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Start Trip', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                Icon(Icons.location_on, color: Theme.of(context).primaryColor, size: 25)
                          ],
                        )),
                      ],
                    );
                  })
            ),
          ),
        ), isNotification: true);
  }
}
