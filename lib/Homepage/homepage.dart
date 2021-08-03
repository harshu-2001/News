import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/Homepage/General.dart';
import 'package:news_app/Homepage/Sources.dart';
import 'package:news_app/Homepage/news_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Widget/tabs.dart';
import 'package:news_app/pages/general.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late News no;
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          
          //backgroundColor:
          appBar: AppBar(
            backgroundColor: Colors.orange[600],
            bottom: TabBar(
            isScrollable: true,
            
          //    indicator: BoxDecoration(
               
          //      border:Border.all(color: Colors.black,width:2),
            
          //    shape: BoxShape.rectangle,
          //    color: Colors.orange[300],
          //    borderRadius: BorderRadius.circular(25),
          //  ),
            indicatorColor: Colors.black87,
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 2.3,
            indicatorSize:TabBarIndicatorSize.label ,
              tabs: [

                    Tablls("General"),
                    Tablls("Health"),
                    Tablls("Sports"),
                    Tablls("Entertainment"),
                    Tablls("Business"),
                    Tablls("Science"),
                    Tablls("Technology"),
                    
            ],),
            elevation: 0,
            automaticallyImplyLeading: false,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              
               SizedBox(width: 10,),
               Row(
                 children: [
                   Text("R",
                   style:GoogleFonts.courgette(
                     fontSize: 28,
                     fontWeight: FontWeight.w700,
                     color: Colors.red[600],
                     letterSpacing: 2,
                     ),),
                   Text("ed",
                   style:GoogleFonts.courgette(
                     fontSize: 28,
                     fontWeight: FontWeight.w700,
                     color: Colors.red[600],
                     letterSpacing: 2
                     ),
                   ),
                   Text("Birds",
                   style:GoogleFonts.courgette(
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                     letterSpacing: 2,
                     color: Colors.white,
                     ),
                   ),
                   
                 ],
               ),
               IconButton(
                 onPressed:(){ Fluttertoast.showToast(
                   msg: " Available in next version",
                   textColor: Colors.white,
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.CENTER,
                   fontSize: 16,
                   backgroundColor: Colors.red,
                   
                   );},
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
                   }, icon: CircleAvatar(backgroundImage: AssetImage("asset/images/images.png"),radius: 20,),
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