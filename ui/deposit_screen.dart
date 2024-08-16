import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {

  bool loading= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text('Deposit Rs. 500 in the account and upload evidance payment'),
            const Text('Easypaisa Account - 0314-1234567'),
            const Text('Account Title - Sajid Mehmood'),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    )
                ),
                child: const Icon(Icons.image),
                //child: _image !=null ? Image.file(_image!.absolute):
                //const Center(child: Icon(Icons.image)),
              ),
            ),
            const SizedBox(height: 20,),
            RoundButton(title: 'Submit', loading: loading, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
