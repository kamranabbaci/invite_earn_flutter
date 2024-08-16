import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invite_earn/ui/deposit_screen.dart';
import 'package:invite_earn/ui/earn_screen.dart';
import 'package:invite_earn/ui/home_screen.dart';
import 'package:invite_earn/ui/profile_screen.dart';
import 'package:invite_earn/ui/withdraw_screen.dart';
import '../util/utils.dart';
import 'auth/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 0;
  final auth = FirebaseAuth.instance;

  List screenList = [
    const HomeScreen(),
    const DepositScreen(),
    const EarnScreen(),
    const WithdrawScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      //print(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome - Kamran', style: TextStyle(color: Colors.white, fontSize: 14),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((onValue){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
            }).onError((error, stackTrace) {
              utils().toastMessage(error.toString());
            });
          },
              icon: const Icon(Icons.logout, color: Colors.white,)),
          const SizedBox(width: 20,),
        ],

      ),

        body: screenList[currentIndex],

        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.blueGrey, spreadRadius: 2, blurRadius: 20),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.deepPurple, //Selected Icon color. Overrides primary Color
                showUnselectedLabels: true,
                unselectedLabelStyle:
                const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                selectedLabelStyle:
                const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),

                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                selectedIconTheme: const IconThemeData(color: Colors.white),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home,), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.monetization_on,), label: 'Deposit'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.compass_calibration_sharp,), label: 'Earn'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.currency_exchange_rounded), label: 'Withdraw'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],


                  currentIndex: currentIndex,
                  selectedItemColor: Colors.white,
                  onTap: _onItemTapped,
                  elevation: 5
              ),
            )
        )
    );
  }
}
