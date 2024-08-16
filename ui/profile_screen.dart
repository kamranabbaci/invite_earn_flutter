import 'package:flutter/material.dart';
import 'package:invite_earn/services/user.dart';
import 'package:invite_earn/widgets/reuseable_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User user = User();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
      future: user.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
        }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
        }
          final userData = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 60,child: Icon(Icons.person),),
                    const SizedBox(height: 40),
                    ReuseableRow(icon: Icons.person, title: 'Name', value: userData['name']),
                    const SizedBox(height: 20,),
                    ReuseableRow(icon: Icons.person, title: 'Mobile Number', value: userData['mobile']),
                    const SizedBox(height: 20,),
                    ReuseableRow(icon: Icons.person, title: 'Email', value: userData['email']),
                    ],
                );
              },
            ),
          );
  }
}