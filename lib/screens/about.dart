import 'package:flutter/material.dart';
import 'package:gold/utils/universal.dart';
Widget aboutScreen(double _width){
  _width=_width-(20.0);
  return Container(
    padding: EdgeInsets.fromLTRB(10.0,5,10,5),
    color: UniversalVariables.blackColor,
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),
        Center(
          child: Text(
            "Shivam Jwellery",
            style:TextStyle(fontSize: 40, fontWeight: FontWeight.w900,letterSpacing: 1.2,color: UniversalVariables.goldColor),
          ),
        ),
        Center(
          child: Row(
          children: <Widget>[
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            Image(image: AssetImage("images/line.png"),width: _width/7),
            
          ],
      ),
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        Container(
          child: Column(
            children: <Widget>[
              Text("ABOUT",
              style:TextStyle(fontSize: 25, fontWeight: FontWeight.w900,letterSpacing: 1.2,color: UniversalVariables.goldColor),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text("Jewellery stores provide many services such as repairs, remodeling, restoring, designing and manufacturing pieces.",
                style:TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color: UniversalVariables.ligthGoldTextColor),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Text("PHONE",
              style:TextStyle(fontSize: 25, fontWeight: FontWeight.w900,letterSpacing: 1.2,color: UniversalVariables.goldColor),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text("999999999",
              style:TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color: UniversalVariables.ligthGoldTextColor),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Text("ADDRESS",
              style:TextStyle(fontSize: 25, fontWeight: FontWeight.w900,letterSpacing: 1.2,color: UniversalVariables.goldColor),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text("line1, city, INDIA",
              style:TextStyle(fontSize: 18, fontWeight: FontWeight.w900,color: UniversalVariables.ligthGoldTextColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}