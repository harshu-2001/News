import 'package:flutter/material.dart';
import 'package:news_app/Homepage/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.of(context).pushReplacementNamed("Home");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}