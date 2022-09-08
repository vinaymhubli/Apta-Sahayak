import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:speaking_app/views/speak.dart';
class SplashHome extends StatefulWidget {
  SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 6),
    (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SpeakHome()));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.asset('assets/india.gif'),
            Lottie.asset('assets/translator.json',height: 190,width: 150)

          ],
        ),
      ),
    );
  }
}