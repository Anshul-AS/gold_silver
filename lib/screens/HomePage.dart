import 'package:flutter/material.dart';
import 'package:gold/screens/HomeScreen2.dart';
import 'package:gold/utils/universal.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const duration = const Duration(milliseconds: 6000);
    Timer.periodic(duration, (Timer timer){
      setState(() {
        this.flag=false;
        timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(flag){
      return Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 120, 0, 10)),
              Image(image: AssetImage("images/gold1.png"),width: 300.0,),
              title(),
            ],
          ),
        ),
      );
    }else{
      return HomePage2();
    }
  }

  Widget title(){
    return Shimmer.fromColors(
      child: FlatButton(
        onPressed: (){},
        padding: EdgeInsets.all(35),
        child: Text(
          "Shivam Jwellery",
          style:TextStyle(fontSize: 40, fontWeight: FontWeight.w900,letterSpacing: 1.2),
        ),
      ), 
      baseColor: UniversalVariables.goldColor, 
      highlightColor: UniversalVariables.senderColor,
    );
  }



}