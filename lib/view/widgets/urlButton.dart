import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';

class Urlbutton extends StatefulWidget {
  final String text;
  const Urlbutton({super.key,required this.text});

  @override
  State<Urlbutton> createState() => _UrlbuttonState();
}

class _UrlbuttonState extends State<Urlbutton> {
  bool isHovered =false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_)=>setState(() {
        isHovered = true;
      }),
      onExit: (_)=>setState(() {
        isHovered = false;
      }),
      child: Container(height: 35,width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:isHovered?Colors.lightGreen.withOpacity(0.15):Colors.transparent,
            border: Border.all(color: Colors.lightGreenAccent)
        ),
        child: Center(child: Text(widget.text,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textMuted),)),
      ),
    );
  }
}
