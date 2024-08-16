import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invite_earn/ui/dashboard_screen.dart';
import 'package:invite_earn/util/utils.dart';

class Validate{
  final auth = FirebaseAuth.instance;

  void LoginValidaton(String email, String password, BuildContext context){
    auth.signInWithEmailAndPassword(email: email, password: password).then
      ((onValue){
        utils().toastMessage(email.toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
    }).onError((error, stackTrace){
      utils().toastMessage(error.toString());
    });

  }
}