
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User{

  final fireStoreRef = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;


  // factory user.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   final data = document.data()!;
  //   return user(
  //       uid: document.id,
  //       name: data['name'],
  //       email: data['email'],
  //       mobileNumber: data['mobile']
  //   );
  // }

  Future<Map<String, dynamic>> getUserData() async {
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    final DocumentSnapshot <Map<String, dynamic>> userDocument = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get();
    if (userDocument.exists)
    {
      return userDocument.data()!;
    } else {
      throw Exception('User not found');
    }
  }

  Future <void> addWithdrawRequest(
      TextEditingController amountController,
      TextEditingController bankController,
      TextEditingController accountNoController,
      TextEditingController accountTitleController,) async{
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    fireStoreRef.doc(uid).collection('account_details').doc(uid).set({
      'id': uid,
      'amount': amountController.text.toString(),
      'bank': bankController.text.toString(),
      'account_number': accountNoController.text.toString(),
      'account_title': accountTitleController.text.toString(),
      'status': 'pending'
    });
  }

  Future<bool> getPendingWithdrawls() async {
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    final userDocumentRef = FirebaseFirestore.instance.collection('Users').doc(uid);
    final accountDocumentRef = await userDocumentRef.collection('account_details').doc(uid).get();
      if (accountDocumentRef.exists)
      {
        return true;
      } else {
        return false;
        //throw Exception('User not found');
      }
  }

  Future <String> getEarnedAmount() async {
    int earning = 0;
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    try{
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('earning')
          .get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();
        earning = (data['earning']);
      }
      return earning.toString();
    }
    catch (e) {
      return e.toString();
    }
  }


  Future <String> getPendingWithdrawalAmount() async {
    String pendingAmount = '';
    final currentUser = auth.currentUser;
    final String uid = (currentUser?.uid).toString();
    try{
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('account_details')
          .get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();
        pendingAmount = (data['amount']);
      }
      return pendingAmount.toString();
    }
    catch (e) {
      return e.toString();
    }
  }

  // Future<Map<String, dynamic>> getEarnedAmount() async {
  //   final currentUser = await auth.currentUser;
  //   final String uid = (currentUser?.uid).toString();
  //   final DocumentSnapshot <Map<String, dynamic>> snapshot = (await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(uid)
  //       .collection('earning')
  //       .get()) as DocumentSnapshot<Map<String, dynamic>>;
  //   if (snapshot.exists)
  //   {
  //     return snapshot.data()!;
  //   } else {
  //     throw Exception('User not found');
  //   }
  //}


}