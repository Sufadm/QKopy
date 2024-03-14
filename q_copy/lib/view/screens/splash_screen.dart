import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:q_copy/view/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHomeScreen();
    super.initState();
  }

  navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const DashboardScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.network(
            "https://lottie.host/1e0d435f-b8bb-425c-879b-5382137825e1/iTAejqQcdm.json"),
      ),
    );
  }
}
