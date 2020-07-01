import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold/screens/about.dart';
import 'package:gold/screens/contact.dart';
import 'package:gold/utils/universal.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math';
import 'dart:convert';


class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  double g1=0;
  double g2=0;
  double g3=0;
  double g4=0;
  double g5=0;
  double s1=0;
  double s2=0;
  double s3=0;
  double s4=0;
  double s5=0;
  var datagold;
  var datasilver;
  bool loading1=true;
  bool loading2=true;
  var imageval=0;
  AssetImage one0=AssetImage("images/1.jpeg");
  AssetImage one1=AssetImage("images/2.jpeg");
  AssetImage one2=AssetImage("images/3.jpeg");
  AssetImage one3=AssetImage("images/4.jpeg");
  AssetImage one4=AssetImage("images/5.jpeg");
  AssetImage one5=AssetImage("images/6.jpeg");
  AssetImage currentimage=AssetImage("images/1.jpeg");
  double _label=10;
  PageController pageController;
  int _page=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController();
    getDataGold();
    getDataSil();
  }

  Future<String> getDataGold() async{
    var resp=await http.get(
      Uri.encodeFull("https://www.goldapi.io/api/XAU/INR"),
      headers: {
        "Accept": "application/json",
        "x-access-token": "goldapi-dji9yykc2f2imo-io"
      }
    );
    setState(() {
      loading1=false;
      var temp = json.decode(
        resp.body
      );
      datagold=temp;
      g1=datagold["open_price"];
      g2=datagold["high_price"];
      g3=datagold["low_price"];
      g4=datagold["bid"];
      g5=datagold["ask"];
      
    });
  }
  Future<String> getDataSil() async{
    var resp=await http.get(
      Uri.encodeFull("https://www.goldapi.io/api/XAG/INR"),
      headers: {
        "Accept": "application/json",
        "x-access-token": "goldapi-dji9yykc2f2imo-io"
      }
    );
    setState(() {
      loading2=false;
      var temp = json.decode(
        resp.body
      );
      datasilver=temp;
      s1=datasilver["open_price"];
      s2=datasilver["high_price"];
      s3=datasilver["low_price"];
      s4=datasilver["bid"];
      s5=datasilver["ask"];
    });
  }


  void changeimage(){
    var temp=imageval+1;
    temp=temp%6;
    setState(() {
      if(temp==0){
        imageval=0;
        currentimage=one0;
      }
      if(temp==1){
        imageval=1;
        currentimage=one1;
      }
      if(temp==2){
        imageval=2;
        currentimage=one2;
      }
      if(temp==3){
        imageval=3;
        currentimage=one3;
      }
      if(temp==4){
        imageval=4;
        currentimage=one4;
      }
      if(temp==5){
        imageval=5;
        currentimage=one5;
      }
    });
  }

  void onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: PageView(
        children: <Widget>[
          ratesScreen((MediaQuery.of(context).size.width)/7),
          contactScreen(MediaQuery.of(context).size.width),
          aboutScreen((MediaQuery.of(context).size.width)),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        child:Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: UniversalVariables.blackColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money,
                  color: (_page==0)
                  ?UniversalVariables.lightGoldColor
                  :UniversalVariables.greyColor
                ),
                title: Text(
                  "Rates",
                  style: TextStyle(
                    fontSize: _label,
                    color: (_page==0)
                      ?UniversalVariables.lightGoldColor
                      :UniversalVariables.greyColor 
                  ),
                )
              ),
              //2
              BottomNavigationBarItem(
                icon: Icon(Icons.phone,
                  color: (_page==1)
                  ?UniversalVariables.lightGoldColor
                  :UniversalVariables.greyColor
                ),
                title: Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: _label,
                    color: (_page==1)
                      ?UniversalVariables.lightGoldColor
                      :UniversalVariables.greyColor 
                  ),
                )
              ),
              //3
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                  color: (_page==2)
                  ?UniversalVariables.lightGoldColor
                  :UniversalVariables.greyColor
                ),
                title: Text(
                  "About",
                  style: TextStyle(
                    fontSize: _label,
                    color: (_page==2)
                      ?UniversalVariables.lightGoldColor
                      :UniversalVariables.greyColor 
                  ),
                )
              )
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          )
        )
      ),
    );
  }


  //###########################################

Widget ratesScreen(double _width){
  
 
  Widget heading(){
    return Center(
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
            Text("SJ",
            style:TextStyle(fontSize: 40, fontWeight: FontWeight.w600,letterSpacing: 1.2,color: UniversalVariables.goldColor,fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
            Text("S",
            style:TextStyle(fontSize: 35, fontWeight: FontWeight.w500,color: UniversalVariables.goldColor),
            ),
            Text("hivam",
            style:TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: UniversalVariables.goldColor),
            ),
            Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
            Text("J",
            style:TextStyle(fontSize: 35, fontWeight: FontWeight.w500,color: UniversalVariables.goldColor),
            ),
            Text("wellery",
            style:TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: UniversalVariables.goldColor),
            ),
          ],
        )
      );
  }

  Widget table1(){
    return Table(
      border: TableBorder.all(color: UniversalVariables.lightGoldColor,width: 2.0),
      
      defaultColumnWidth: FractionColumnWidth(.3),
      children: [
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Prices",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Gold",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Silver",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
        //2
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Open Price",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$g1",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$s1",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
        //3
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("High",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$g2",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$s2",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
        //4
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Low",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$g3",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$s3",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
      ],
    );

  }

  Widget table2(){
    return Table(
      border: TableBorder.all(color: UniversalVariables.lightGoldColor,width: 2.0),
      
      defaultColumnWidth: FractionColumnWidth(.3),
      children: [
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("BID",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("ASK",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
        //2
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Gold",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$g4",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$g5",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
        //3
        TableRow(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("Silver",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$s4",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child:Text("$s5",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),)
              )
            ),
          ]
        ),
      ],
    );

  }



  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.all(20.0)),
      heading(),
      Row(
        children: <Widget>[
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          Image(image: AssetImage("images/line.png"),width: _width),
          
        ],
      ),
      Padding(padding: EdgeInsets.all(10.0)),
      table1(),
      Padding(padding: EdgeInsets.all(7.0)),
      Container(child:Center(child:Text("*All rates in INR"))),
      Padding(padding: EdgeInsets.all(7.0)),
      table2(),
      Padding(padding: EdgeInsets.all(10.0)),
      Expanded(child: Container(
        padding: EdgeInsets.all(5.0),
        child: FlatButton(
         onPressed: (){
           changeimage();
         },
         child: Image(image: currentimage,)),
      )),
    ]
  );
}

  //############################################

}