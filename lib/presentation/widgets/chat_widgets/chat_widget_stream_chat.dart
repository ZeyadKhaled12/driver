
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_widget_msg.dart';



class ChatWidgetStreamChat extends StatelessWidget {
  const ChatWidgetStreamChat({Key? key, required this.parentUid}) : super(key: key);
  final String parentUid;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(

          stream: FirebaseFirestore.instance
              .collection('chat')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection(parentUid).orderBy('createdAt', descending: true)
              .snapshots(),

          builder: (ctx, snapShot){
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)));
            }

            final docs = snapShot.data!.docs;

            return ListView.builder(
              reverse: true,
              itemBuilder: (ctx, index){
                return ChatWidgetMsg(msg: docs[index]['text'],
                    isCurrentUser: docs[index]['userId'] ==
                        FirebaseAuth.instance.currentUser?.uid);
              },
              itemCount: docs.length,
            );
          },
        )
      ),
    );
  }
}
