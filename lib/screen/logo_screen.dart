import 'package:flutter/material.dart';
 
class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushNamed(context,"/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_Logo.jpg"),
                  fit: BoxFit.cover)
            ),
          child: Center(
            child: Text("Allovemer",style: TextStyle(fontFamily: "TH-Chara",fontSize: 70),),
          ),
          
        ),
        
      );
      
  }
} 