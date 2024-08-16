import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'code_generator.dart';

class ProfileServices{

  final fireStoreRef = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  TextEditingController? mobileNoController;


  ProfileServices(emailController, passwordController, nameController, mobileNoController){
    this.emailController = emailController;
    this.passwordController = passwordController;
    this.nameController = nameController;
    this.mobileNoController = mobileNoController;
  }


  Future <void> createUserWithEmail() async{
      await auth.createUserWithEmailAndPassword(
          email: emailController!.text.toString(),
          password: passwordController!.text.toString());
    }

  Future <void> RegisterUser() async{
    final referCode = CodeGenerator.generateCode('refer');

    //final referLink = DynamicLinkGenerator.instance?.createReferLink(referCode);
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    fireStoreRef.doc(uid).set({
      'id': uid,
      'email': emailController!.text.toString(),
      'name': nameController!.text.toString(),
      'mobile': mobileNoController!.text.toString(),

      //to be implemented
      'refer_code': referCode,
      'refer_link' : "referLink",
    });
  }

  Future <void> setInitialAmount () async{
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    fireStoreRef.doc(uid).collection('earning').doc(uid).set({
      'id': uid,
      'earning' : 0
    });
  }


  // Future <List<user>> getUserData() async {
  //   final snapshot = await fireStoreRef.get();
  //   final userData = snapshot.docs.map((e)=> user.fromSnapshot(e)).toList();
  //   return userData;
  // }



}


