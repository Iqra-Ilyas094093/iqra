import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:iqra/utils/colors.dart';

class SkillsCarouselBuilder extends StatelessWidget {
  final  List<String> imagesList;
  final String headlineText;
  const SkillsCarouselBuilder({super.key, required this.imagesList, required this.headlineText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 550,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(headlineText,style: GoogleFonts.poppins(fontSize: 23,color: AppColors.text,fontWeight: FontWeight.w500),),
            ),
          ),
          CarouselSlider.builder(
            itemCount: imagesList.length,
            itemBuilder: (context,index,realIndex){
              return AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(imagesList[index],fit: BoxFit.cover,),
              );
            },
            options: CarouselOptions(
              height: 120,
              viewportFraction: 0.2,
              autoPlay: true,
              enlargeFactor: 0.3,
              scrollPhysics: BouncingScrollPhysics(),
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
            ),
          ),
        ],
      ),
    );
  }
}
