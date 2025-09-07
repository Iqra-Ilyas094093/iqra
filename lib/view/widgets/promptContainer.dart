import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Promptcontainer extends StatefulWidget {
  final String num;
  final String text;
  const Promptcontainer({super.key, required this.num, required this.text});

  @override
  State<Promptcontainer> createState() => _PromptcontainerState();
}

class _PromptcontainerState extends State<Promptcontainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return  MouseRegion(
      onEnter: (_)=>setState(() {
        isHovered = true;
      }),
      onExit: (_)=>setState(() {
        isHovered = false;
      }),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen,width: 2),
          color: isHovered?Colors.lightGreen.withOpacity(0.2):Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GradientText(
                  widget.num,
                  colors: [Colors.lightGreen, Colors.lightGreenAccent],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Text(
                widget.text,
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              viewButton('View Prompt'),
              viewButton('Result'),

            ],
          ),
        ),
      ),
    );
  }
  Widget viewButton(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightGreen.shade800,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
