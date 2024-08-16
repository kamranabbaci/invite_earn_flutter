import 'package:flutter/material.dart';
import 'package:invite_earn/services/profile_services.dart';
import 'package:invite_earn/ui/auth/login_screen.dart';
import 'package:invite_earn/ui/dashboard_screen.dart';
import '../../widgets/round_button.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUserScreen> {


  bool loading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.white),),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.text,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    suffixIcon: Icon(Icons.format_color_text),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Name can''t be empty';
                    }
                    else{return null;}
                  }
              ),
              const SizedBox(height: 20,),
              TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern.toString());
                    if (!regex.hasMatch(value!)) {
                      return 'Enter Valid Email';
                    }
                    else{return null;}
                  }
              ),
              const SizedBox(height: 20,),
              TextFormField(
                  controller: mobileNoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    hintText: '0300 1234567',
                    hintStyle: TextStyle(fontSize: 12.0),
                    suffixIcon: Icon(Icons.numbers),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Mobile number can''t be empty';
                    }
                    else if(value.length!= 11){
                      return 'Mobile number must be of 11 digits';
                    }
                    else{return null;}
                  }
              ),
              const SizedBox(height: 20,),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock)
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Password can''t be empty';
                    }
                    else{
                      return null;}
                  }
              ),
              const SizedBox(height: 50,),
        
              RoundButton(title: 'Register', loading: loading, onTap: () async {
                if(_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  ProfileServices profileServices = ProfileServices(emailController, passwordController, nameController, mobileNoController);

                  await profileServices.createUserWithEmail();
                  await profileServices.RegisterUser();
                  await profileServices.setInitialAmount();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => const DashboardScreen()));
                  setState(() {
                    loading = false;
                  });
                }
                else{
                  setState(() {
                    loading = false;
                  });
                }
              }),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  }, child: const Text("Login"))
                ],
              ),
        
            ],
        
                ),
          ),
        ),
      ),
    );
  }
}
