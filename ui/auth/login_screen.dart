import 'package:flutter/material.dart';
import 'package:invite_earn/services/validate.dart';
import 'package:invite_earn/ui/auth/login_with_phone_number.dart';
import 'package:invite_earn/ui/auth/register_user.dart';
import 'package:invite_earn/widgets/round_button.dart';

import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Email can''t be empty';
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
              RoundButton(title: 'Login',loading: loading, onTap: (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    loading = true;
                  });
                  Validate().LoginValidaton(emailController.text.toString(), passwordController.text.toString(), context);
                }
                setState(() {
                  loading = false;
                });
              }),
              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                }, child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginWithPhoneNumber()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Center(child: Text("Login with phone number")),),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterUserScreen()));
                  }, child: const Text("Sign up"))
                ],
              ),

            ],

          ),
        ),
      ),
    );
  }
}
