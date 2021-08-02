//import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/Homepage/news_api.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        length: 5,
              child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(indicatorColor: Colors.blue.shade400,
            isScrollable: true,
            //unselectedLabelStyle: ,
            unselectedLabelColor: Colors.blue.shade300,
              tabs: [
                
                    Tab(child: Text("General",style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),),),
                    Tab(child: Text("Sports",style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),),),
                    Tab(child: Text("Entertainment",style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),),

                    ),
                    Tab(child: Text("Science",style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),),

                    ),Tab(child: Text("Technology",style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),),

                    )
                    
                    
            ],),
            elevation: 0,
            backgroundColor: Colors.white,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              IconButton(
                onPressed: (){},
               icon: Icon(
                 Icons.search,
                 size: 25,
                 color: Colors.black,
                )
               ),
               //SizedBox(width: 20,),
               Row(
                 children: [
                   Text("Headl",
                   style:GoogleFonts.poppins(
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                     color: Colors.black,
                     ),
                   ),
                   Text("ines",
                   style:GoogleFonts.poppins(
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                     color: Colors.blue.shade400,
                     ),
                   ),
                 ],
               ),
               //SizedBox(width: 20,),
               Ink(
                 height: 100,
                 width: 50,
                decoration:ShapeDecoration(
                  shape: CircleBorder(side:BorderSide.none),
                   //color: Colors.black,
                  
                   
                   ),
                child: TextButton(
                              onPressed: () {},
                              
                              style: TextButton.styleFrom(primary: Colors.grey.shade300),
                              child: CircleAvatar(
                                //backgroundColor: Colors.indigo.shade400,
                                //foregroundColor: Colors.black,
                                radius:30,
                                ),
                       ),
              )
            
               
            ],)
          ),
          body: TabBarView(
                    children:<Widget>[ ListView(
                      children: [ 
                    ListView.builder(
                        itemCount: news.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          print(news[index].urlToImage.toString());
                          return Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Container(
                             //margin: EdgeInsets.symmetric(vertical: 20.0),
                             
                             child: Card(
                               
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                               child: Padding(
                                 padding: const EdgeInsets.all(4.0),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Container(
                                      //  height: 400,
                                      //  width: 400,
                                       child: Image.network(news[index].urlToImage.toString(),)
                                     ),
                                     Container(
                                       
                                       child: Column(
                                         children: [
                                           Text(news[index].title,
                                           style:GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            ),
                                           ),
                                           Text(news[index].description,
                                           style:GoogleFonts.poppins(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.w00,
                                            color: Colors.black,
                                            ),
                                           ),
                                           
                                           SizedBox(height:6.0),
                                       TextButton.icon(
                                         onPressed:(){},
                                         label: Text("delete article",
                                         style: TextStyle(
                                           fontSize: 10,
                                           color: Colors.grey.shade500,
                                         ),
                                         ),
                                         icon: Icon(Icons.delete,
                                         size: 15,
                                         color: Colors.redAccent.shade700,),
                                         
                                         ),
                                         ],
                                       ),

                                     ),

                                   ],
                                 ),
                               ),
                             ),),);
                        }),
                  ],
            ),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            ]
          ),
        ),
      ),
    );
  }
}