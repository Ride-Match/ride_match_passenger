import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ride Match',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 10.w,
                  fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage('assets/splash.png')),
          ]),
    );
  }
}