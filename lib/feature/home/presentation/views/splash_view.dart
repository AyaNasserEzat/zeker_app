import 'package:flutter/material.dart';
import 'package:zker/feature/home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }
   void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
     
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeView();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Column(
          children: [
            Text("ذِكر"),
          ],
        ),
      ),
    );
  }
}