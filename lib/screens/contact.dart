import 'package:flutter/material.dart';
import 'package:gold/utils/universal.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
Widget contactScreen(double width1){
  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print("Could not launch $command");
    }
  }
  
  return Container(
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),
        Center(
          child: Text(
            "CONTACT",
            style:TextStyle(fontSize: 40, fontWeight: FontWeight.w900,letterSpacing: 1.2,color: UniversalVariables.goldColor),
          ),
        ),
        Row(
        children: <Widget>[
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          Image(image: AssetImage("images/line.png"),width: width1/7),
          
        ],
      ),
        Padding(padding: EdgeInsets.all(10.0)),
        Center(
          child: Container(
            width: (2/3)*width1,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: UniversalVariables.lightGoldColor,
              onPressed: (){
                customLaunch('tel:9999999999');
              },
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child:Image(image: AssetImage("images/gold1.png"),width:(1/3)*width1,)),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child: Text("AVI KUMAR",style: TextStyle(fontSize: 20,color: Colors.black),),),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child: Text("9999999999",style: TextStyle(fontSize: 15,color: Colors.black),),),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(8.0)),
        Center(
          child: Container(
            width: (2/3)*width1,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: UniversalVariables.lightGoldColor,
              onPressed: (){
                customLaunch('tel:9999999999');
              },
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child:Image(image: AssetImage("images/gold1.png"),width: (1/3)*width1,)),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child: Text("AVI",style: TextStyle(fontSize: 20,color: Colors.black),),),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(child: Text("9999999999",style: TextStyle(fontSize: 15,color: Colors.black),),),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}