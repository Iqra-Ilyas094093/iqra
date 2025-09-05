import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AiPrompting extends StatefulWidget {
  final GlobalKey sectionkey;
  final Size size;

  const AiPrompting({super.key, required this.sectionkey, required this.size});

  @override
  State<AiPrompting> createState() => _AiPromptingState();
}

class _AiPromptingState extends State<AiPrompting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.sectionkey,
      height: widget.size.height,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          GradientText(
            'Prompt Engineer', colors: [Colors.lightGreen, Colors.lightGreenAccent],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 35,),),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.greenAccent),
              color: Colors.transparent
            ),
            child: Row(
              children: [
                GradientText(
                  '1', colors: [Colors.lightGreen, Colors.lightGreenAccent],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 35,),),
                Text(
                  'Enter your valuable Feedback,',
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      fontSize: 35,
                      color: AppColors.text,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 50,
                  child: Center(child: Text('View Prompt',style: GoogleFonts.poppins(fontSize: 15,color: Colors.greenAccent,fontWeight: FontWeight.w500,),),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
