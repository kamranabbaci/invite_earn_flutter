import 'package:flutter/material.dart';

import '../services/user.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

User user = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String>(
            future: user.getEarnedAmount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              else {
                return CircleAvatar(
                  radius: 100,
                    child: Text('Earning = ${snapshot.data}'));
              }
            },
          ),
          const SizedBox(width: 30,),
          FutureBuilder<String>(
            future: user.getPendingWithdrawalAmount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              else if (snapshot.data == '') {
                return const CircleAvatar(
                    radius: 100,
                    child: Text('Pending withdrawal = 0'));
              }
              else {
                return CircleAvatar(
                    radius: 100,
                    child: Text('Pending withdrawal = ${snapshot.data}'));
              }
            },
          ),
        ],
      ),
    );
  }
}
