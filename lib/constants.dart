import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var bgcolor = Color.fromRGBO(24, 24, 24, 1);
var btnpresscolor = Color.fromRGBO(94, 35, 4, 1);
var filebtncolor = Color.fromRGBO(24, 24, 24, 1);
var folderbtncolor = Color.fromRGBO(24, 24, 24, 1);

var btncolor = Color.fromRGBO(252, 100, 18, 1);
var txtcolor = Color.fromRGBO(247, 106, 30, 1);
var txtstyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500));
var h1txtstyle = GoogleFonts.poppins(
    textStyle:
        TextStyle(color: txtcolor, fontSize: 25, fontWeight: FontWeight.w600));
var alttxt = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20));
var smltxt = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w200, fontSize: 17));
int ffvalue = 0;
int upvalue = 0;
String? outdir;
String? indir;
int upratio = 4;
String imgtype = 'png';
String mdname = 'realesr-animevideov3';
int imgtypeno = 1;
String filepath = '';
String inputfilepath = 'assets/sdimg_lq.png';
String outputfilepath = 'assets/sdimg_up.png';
final inputtxtController = TextEditingController();
String? outname;
String? cmd;
String? checks;
int errcheck = 0;
