import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/view/widgets/urlButton.dart';

class ProjectBox extends StatelessWidget {
  final String ImageUrl;
  final String name;
  const ProjectBox({super.key, required this.ImageUrl, required this.name,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 300,width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColors.bg,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              // color: Colors.red,
              child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                  child: Image.network(ImageUrl,fit: BoxFit.cover,)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Text(name,style: GoogleFonts.poppins(fontSize: 20,color: AppColors.text,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Urlbutton(text: 'View Code'),
                Urlbutton(text: 'Live Preview'),
              ],
            )
          ],
        ),),
    );
  }
}
