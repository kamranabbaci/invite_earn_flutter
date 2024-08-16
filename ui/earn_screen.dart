import 'package:flutter/material.dart';


class EarnScreen extends StatefulWidget {
  const EarnScreen({super.key});

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Invite More! Earn More', style: TextStyle(fontSize: 30, color: Colors.green),)),

        ],
      ),

    );
  }
}
