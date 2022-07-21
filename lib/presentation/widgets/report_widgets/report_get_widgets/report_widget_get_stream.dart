// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/functions/report_fun.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'report_widget_get_card.dart';

class ReportWidgetGetStream extends StatefulWidget {
  const ReportWidgetGetStream({Key? key}) : super(key: key);


  @override
  _ReportWidgetGetStreamState createState() => _ReportWidgetGetStreamState();
}

class _ReportWidgetGetStreamState extends State<ReportWidgetGetStream> {


  final ReportFun _reportFun = ReportFun();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('report').snapshots(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme
                            .of(context)
                            .primaryColor)));
          }

          final docs = snapShot.data!.docs;

          if(docs.isNotEmpty) {
            return docs[0]['is_accepted'] == false &&
                (docs[0]['uid'] != FirebaseAuth.instance.currentUser?.uid) ?
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReportWidgetGetCard(
                      name: docs[0]['name'],
                      mobile: docs[0]['mobile'],
                      area: docs[0]['area'],
                      childrenNum: docs[0]['children'],
                      imageUrl: docs[0]['image_url'],
                      notes: docs[0]['notes'],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: SizedBox(
                          width: 120,
                          height: 50,
                          child: FlatButton(
                              onPressed: () async {
                                await _reportFun.urlLauncherGoGoogleMap(
                                    lat: docs[0]['lat'],
                                    long: docs[0]['long']);
                              },
                              child: const Text('Accept',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ))
                  ],
                ),
              ),
            ) :
            const Text('No report yet!', style: TextStyle(
                color: Colors.black, fontSize: 25
            ),);
          }
          return  const Text('No report yet!', style: TextStyle(
              color: Colors.black, fontSize: 25
          ),);

        });
  }
}
