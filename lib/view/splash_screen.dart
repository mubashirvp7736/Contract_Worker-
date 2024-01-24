
import 'package:contracterApp/controller/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
  Provider.of<DbProvider>(context,listen: false).gotoScreen(context);
  Provider.of<DbProvider>(context,listen: false). checkuserlogin(context);
    super.initState();
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF7C8363),
      body:Center(
        child: Image(image:AssetImage('assets/splashscreen.png.png'),height: 350,width:360,),
      ) ,
    );
  }

}