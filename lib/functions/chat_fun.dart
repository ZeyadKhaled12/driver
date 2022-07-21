import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ntp/ntp.dart';


class ChatFun{

  Future<Map> getParentDetails({required String parentUid}) async{
    Map _details = {};
    await FirebaseFirestore.instance.collection('parents').doc(parentUid).get()
        .then((value) {
      _details['name'] = value.data()?['name'];
      _details['phone'] = value.data()?['phone'];
      _details['image_url'] = value.data()?['profile_image'];
    });
    return _details;
  }


  Future sendMessage({required String msg, required String parentUid}) async{
    print(msg);
    DateTime _myTime;
    _myTime = await NTP.now();
    await FirebaseFirestore.instance.collection('chat')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(parentUid).doc().set({
      'text': msg,
      'createdAt': _myTime,
      'userId': FirebaseAuth.instance.currentUser?.uid
    });

    await FirebaseFirestore.instance.collection('chat')
        .doc(parentUid)
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc().set({
      'text': msg,
      'createdAt': _myTime,
      'userId': FirebaseAuth.instance.currentUser?.uid
    });
  }

}