
import 'package:driver/functions/personal_detail_fun.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class AuthFun{

  Future loginFun({required String email, required String password, required BuildContext ctx}) async{

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);


    } on FirebaseAuthException catch(e){
      print(e.code);
      if(e.code == 'invalid-email'){
        return 'Invalid Email!';
      }
      else if(e.code == 'user-not-found'){
        return 'The email or password is incorrect';
      }
      else if(e.code == 'wrong-password'){
        return 'Wrong Password';
      }
    }
  }



}