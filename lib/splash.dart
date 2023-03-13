import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffa18cd1), Color(0xfffbc2eb)
                ],)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text("BMI",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Colors.black),),
              Center(
                      child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_kOvJ8c/normal/data.json')
              ),
            ],
          ),
        )
    );
  }
}
