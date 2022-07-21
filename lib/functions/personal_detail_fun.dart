
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/providers/provider_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PersonalDetailFun{

  Future getUserDetails({required BuildContext ctx}) async{
    final _auth = FirebaseAuth.instance.currentUser;
    print(_auth?.uid);
    await FirebaseFirestore.instance.collection('drivers').doc(_auth?.uid).get().then((value) {
      Provider.of<ProviderUserDetails>(ctx, listen: false).getUserDetails(
          token: _auth?.uid, email: _auth?.email, dateOfBirth: value.data()?['date_birth'],
          cardImage:  value.data()?['card_image'],
          profilePic:  value.data()?['profile_pic'],
          mobile:  value.data()?['mobile'], nationalId:  value.data()?['national_id'],
          name: value.data()?['name'],
          licenseExpire: value.data()?['license_expir'], zoneArea: value.data()?['zone_area']);
    });

  }

  String getTimestamp({required Timestamp timestamp}){
    String date = DateFormat('yyyy-MM-dd').format(DateTime.fromMicrosecondsSinceEpoch
      (timestamp.microsecondsSinceEpoch));
    return date;
  }



}