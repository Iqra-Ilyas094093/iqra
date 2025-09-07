import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';

class Numandtextcontainer extends StatelessWidget {
  final String num;
  final String text;
  const Numandtextcontainer({super.key, required this.num, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      // color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(num,style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.text),),
          SizedBox(width: 6,),
          Text(text,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.text,height: 1),softWrap: true,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
