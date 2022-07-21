import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/presentation/widgets/general_widgets/general_app_bar_widgets/general_widget_app_bar_noti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class GeneralWidgetAppBar extends StatelessWidget {
  const GeneralWidgetAppBar({Key? key, required this.title, required this.body,
    this.isNotification = false}) : super(key: key);

  final String title;
  final Widget body;
  final bool isNotification;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
          title: Center(child: Text(title, style: const TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold, color: Colors.black))),
        actions: [
          if(isNotification)

            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('report').snapshots(),
                builder: (ctx, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return  const GeneralWidgetAppBarNoti(isNotAccepted: false);
                  }

                  final docs = snapShot.data!.docs;

                  return
                    docs.isNotEmpty?
                    GeneralWidgetAppBarNoti(isNotAccepted: !docs[0]['is_accepted'] &&
                      docs[0]['uid'] != FirebaseAuth.instance.currentUser?.uid):
                  const GeneralWidgetAppBarNoti(isNotAccepted: false);
                }),

        ],
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
      ),
      body: body,
    );
  }
}

