import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tablls extends StatefulWidget {
  String s;
  var col;
  Tablls(this.s,this.col);
  @override
  _TabllsState createState() => _TabllsState(s,col);
}

class _TabllsState extends State<Tablls> {
  String s;
  var col;
  _TabllsState(this.s,this.col);
  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(s,style:GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: col,
                    
                    ),),); 
  }
}