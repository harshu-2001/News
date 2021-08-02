//import 'dart:html';

import 'package:news_app/Homepage/General.dart';
import 'package:news_app/Homepage/Sources.dart';
import 'package:news_app/Homepage/news_api.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Widget/tabs.dart';
import 'package:news_app/pages/general.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late News no;
  //late Clone co;
  List<Articles>news=[];
  General gen=General();
  late String y;

  Future general()async{
    await gen.getnews();
    setState(() {
    news=gen.news;
    
    });
    }

    
    
  
  
  @override
  void initState(){
    super.initState();
    general();
  }

List tabColor=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          
          //backgroundColor:
          appBar: AppBar(
            backgroundColor: Colors.orange[700],
            //backgroundColor: Colors.tealAccent.shade100,
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
            isScrollable: true,
           
              onTap: (index) {
                      setState(() {

                if(index==0) { tabColor[0] = Colors.black;}
                if(index==1) {tabColor[1] = Colors.black;}
                if(index==2) {tabColor[2] = Colors.black;}
                if(index==3) {tabColor[3] = Colors.black;}
                if(index==4) {tabColor[4] = Colors.black;}  
                if(index==5) {tabColor[5] = Colors.black;}  
                if(index==6) {tabColor[6] = Colors.black;}  
                                    
                  });}
            ,
              tabs: [

                    Tablls("General",tabColor[0]),
                    Tablls("Health",tabColor[1]),
                    Tablls("Sports",tabColor[2]),
                    Tablls("Entertainment",tabColor[3]),
                    Tablls("Business",tabColor[4]),
                    Tablls("Science",tabColor[5]),
                    Tablls("Technology",tabColor[6]),
                    
            ],),
            elevation: 0,
            //backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              
               SizedBox(width: 10,),
               Row(
                 children: [
                   Text("R",
                   style:GoogleFonts.nothingYouCouldDo(
                     fontSize: 28,
                     fontWeight: FontWeight.w700,
                     color: Colors.white
                     ),),
                   Text("ed",
                   style:GoogleFonts.nothingYouCouldDo(
                     fontSize: 28,
                     fontWeight: FontWeight.w700,
                     color: Colors.white
                     ),
                   ),
                   Text(".Birds",
                   style:GoogleFonts.homemadeApple(
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                     color: Colors.white,
                     ),
                   ),
                   
                 ],
               ),
               //SizedBox(width: 20,),
               IconButton(
                onPressed: (){},
               icon: Icon(
                 Icons.search,
                 size: 25,
                 color: Colors.white,
                )
               ),
            
               
            ],
            ),
            
            leading:Builder(builder: (context)=>IconButton(
                 onPressed: (){
                    Scaffold.of(context).openDrawer();
                   }, icon: CircleAvatar(backgroundImage: AssetImage("asset/images/images.png"),),
                   iconSize:25 ,
                   )) ,
            
          ),
      
          drawer: Drawer(
            elevation: 0,
            child: ListView(children: [
              DrawerHeader(child: Text("data")),
            ],),
          ),

          body: TabBarView(
                    children:<Widget>[ 

            Control(),
            Clone("health"),
            Clone("sports"),
            Clone("Entertainment"),
            Clone("Business"),
            Clone("Science"),
            Clone("Technology"),
            
            ]
          ),
        ),
      ),
    );
  }
}