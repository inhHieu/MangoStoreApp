import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../const/checkuser.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Checkuser()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          SizedBox(height: 10),
          Container(
              color: Colors.white,
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
    );
  }
}
