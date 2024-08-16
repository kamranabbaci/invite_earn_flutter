import 'package:flutter/material.dart';
import 'package:invite_earn/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late Animation animation;   //late is used if we want to initialize var later
  late AnimationController animationController;
  late Animation colorAnimation;
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.isLogin(context);
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween(begin: 0.0 ,end: 200.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.white, end: Colors.deepPurple).animate(animationController);
    animationController.addListener((){
      setState(() {

      });
    });
    animationController.forward();
  }
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: colorAnimation.value,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_exchange, color: Colors.white,),
              SizedBox(height: 200,),
              Text('Invite & Earn ', style: TextStyle(fontSize: 15, color: Colors.white),),
            ],
          ),
        ),
      )
    );
  }
}
