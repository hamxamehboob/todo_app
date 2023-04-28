import 'package:flutter/material.dart';
import 'task_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Pic2.png'),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Image.asset('assets/images/Pic.png'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const TaskScreen())));
  }
}
