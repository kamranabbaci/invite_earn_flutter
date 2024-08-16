import 'package:flutter/material.dart';
import 'package:invite_earn/services/user.dart';

import '../widgets/round_button.dart';

class WithdrawScreen extends StatefulWidget {

  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {

  User user = User();
  final accountNoController = TextEditingController();
  final amountController = TextEditingController();
  final accountTitleController = TextEditingController();
  final bankController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 60, child: Text('Earnings = 0'),),
                const SizedBox(height: 20),
                TextFormField(
                    controller: amountController,
                    decoration: const InputDecoration(
                        labelText: 'Amount',
                        suffixIcon: Icon(Icons.attach_money)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Amount can''t be empty';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(height: 10),
                TextFormField(
                    controller: bankController,
                    decoration: const InputDecoration(
                        labelText: 'Bank Name',
                        suffixIcon: Icon(Icons.account_balance)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Bank can''t be empty';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    controller: accountNoController,
                    decoration: const InputDecoration(
                        labelText: 'Account Number',
                        suffixIcon: Icon(Icons.wallet)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Account can''t be empty';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(height: 10,),
                TextFormField(
                    controller: accountTitleController,
                    decoration: const InputDecoration(
                        labelText: 'Account Title',
                        suffixIcon: Icon(Icons.drive_file_rename_outline)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Account can''t be empty';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(height: 20,),

                RoundButton(title: 'Request Withdraw', loading: loading, onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    //_showAlertDialog(context);

                    //print(earnedAmount);

                    bool status = await user.getPendingWithdrawls();
                    if(!status){
                      user.addWithdrawRequest(amountController, bankController, accountNoController, accountTitleController);
                    }
                    else{
                      showDialog(context: context, builder: (builder)=> AlertDialog(
                        title: const Text('Alert'),
                        content: const Text("Another withdrawal is already pending!"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(builder).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              padding: const EdgeInsets.all(14),
                              child: const Text("OK", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ));
                    }


                  }
                }
                ),
              ]
          ),
        ),
      ),
    );
  }
}

//   Future<void> _showAlertDialog(BuildContext context) async {
//     return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: Text('Confirm Action'),
//               content: SingleChildScrollView(
//                 child: ListBody(
//                   children: <Widget>[
//                     Text('Are you sure you want to proceed?'),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text('No'),
//                   onPressed: () {
//                     Navigator.of(context).pop(); // Dismiss alert dialog
//                   },
//                 ),
//                 TextButton(
//                   child: Text('Yes'),
//                   onPressed: () {
//                     // Handle 'Yes' response here
//                     print('User clicked Yes');
//                     Navigator.of(context).pop(); // Dismiss alert dialog
//                   },
//                 ),
//               ]
//           );
//         }
//     );
// }
