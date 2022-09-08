import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:speaking_app/views/splash_screen.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        systemOverlayStyle: const SystemUiOverlayStyle(
          
            statusBarColor: Color.fromARGB(255, 135, 6, 81),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Color.fromARGB(255, 135, 6, 81),
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(255, 135, 6, 81),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 35),
              Container(
                child: Text(
                  'Login With Email',
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 220, 179),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: emailController,
                  onChanged: (value){},
                     decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      )),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 10),
              RaisedButton.icon(
                  onPressed: () async{
                   var magic = Magic.instance;
                   var token =
                 await magic.auth.loginWithMagicLink(email: emailController.text); 
                 if(token.isEmpty){
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => AuthHome()));
                 }
                 else{
                  
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => SplashHome()));
                 }
                  },
                  icon: Icon(Icons.mark_email_read),
                  label: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  splashColor: Colors.white),
              Divider(color: Colors.grey, indent: 20.0, endIndent: 20.0),
              const SizedBox(height: 35),
              Container(
                child: Text(
                  'Login With OTP',
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 220, 179),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: phoneController,
                  onChanged: (value){},
                  decoration: InputDecoration(
                    
                      hintText: 'Enter Mobile Number',
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.phone,color: Colors.white,),
                    
                      )),
                     

                  keyboardType: TextInputType.phone,
                ),
              ),
              RaisedButton.icon(
                  onPressed: () {loginwithphone();},
                  icon: Icon(Icons.phone),
                  label: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  splashColor: Colors.white),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    var magic = Magic.instance;
    var token =
        await magic.auth.loginWithMagicLink(email: emailController.text);
        if(token.isEmpty){
         
        }
else{
 
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashHome()));
  }
  }
   Future<void> loginwithphone() async {
    var magic = Magic.instance;
    var token =
        await magic.auth.loginWithSMS(phoneNumber: phoneController.text);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashHome()));
  }
}
