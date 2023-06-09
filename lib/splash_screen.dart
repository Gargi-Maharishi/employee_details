import 'package:flutter/material.dart';
import 'package:project/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text('Employee details'),
            ),
           ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    navigator();
  }

  Future navigator() async {
    Future.delayed(Duration(seconds: 03), () {
      Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>  HomePage(),
    ),
  );
    });
  }
}