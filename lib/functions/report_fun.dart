

// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location;
import 'package:url_launcher/url_launcher.dart';




class ReportFun{
  
  
  Future sendReportFun({required String notes}) async{

    String name = '';
    String imageUrl = '';
    String mobile = '';
    int children = 0;

    try {

      var collection = FirebaseFirestore.instance.collection('report');
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }

      await FirebaseFirestore.instance.collection('drivers')
          .doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) {
        name = value.get('name');
        imageUrl = value.get('profile_pic');
        mobile = value.get('mobile');
      });
      print('First');

      children = await getChildren();

      print('Second');
      List list = await getCurrentLocation();
      print('THIRD');
      List<Placemark> placeMarks = await placemarkFromCoordinates(list[0],
          list[1]);
      print('FOURTH');

      await FirebaseFirestore.instance.collection('report').add({
        'name': name,
        'children': children,
        'area': placeMarks[0].street,
        'uid': FirebaseAuth.instance.currentUser?.uid,
        'lat': list[0],
        'long': list[1],
        'is_accepted': false,
        'image_url': imageUrl,
        'mobile': mobile,
        'notes': notes
      });
      print('FiFTH');


    }on FirebaseAuthException catch(e){
      throw e.code;
    }
    
  }

  Future<int> getChildren() async{
    int children = await FirebaseFirestore.instance.collection('children').get()
        .then((value) => value.size);
    return children;
  }

  Future getCurrentLocation() async{
    location.Location _location = location.Location();


    bool _serviceEnabled;
    location.PermissionStatus _permissionGranted;
    location.LocationData _locationData;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == location.PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
    return [_locationData.latitude!, _locationData.longitude!];
  }

  Future urlLauncherGoGoogleMap({required double lat, required double long}) async{
    final String link = 'https://maps.google.com/?q=$lat,$long';
    if (await canLaunch(link)) {
      await launch(link);
    }
    else {
      throw 'Could not launch';
    }

  }
}