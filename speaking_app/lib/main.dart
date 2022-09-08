import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
 
import 'package:speaking_app/auth/auth.dart';



Future <void> main()async {
 
 Magic.instance = Magic("pk_live_194A920D3C3C29CA");
  runApp(MyApp());
 
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " TEXT TO SPEAK APP",
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
         const AuthHome(),
         Magic.instance.relayer
          ],
        )
    );
  }
}
  

