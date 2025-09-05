import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Skills extends StatefulWidget {
  final Size size;
  final GlobalKey sectionKey;

  const Skills({super.key, required this.size, required this.sectionKey});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<String> images = [
    'assets/images/flutter-original.svg',
    'assets/images/dart-original.svg',
    'assets/images/git-original.svg',
    'assets/images/supabase-original.svg',
    'assets/images/github-mark-white.svg',
  ];
  final List<String> toolImages = [
    'assets/images/androidstudio-original.svg',
    'assets/images/figma-original.svg',
    'assets/images/vscode-original-wordmark.svg',
    'assets/images/postman-original.svg',
    'assets/images/clarity-original.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.sectionKey,
      height: widget.size.height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GradientText(
            'Skills', colors: [Colors.lightGreen, Colors.lightGreenAccent],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 40,),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 190,
                width: 600,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text('Languages & Framework',style: GoogleFonts.poppins(fontSize: 23,color: AppColors.text,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context,index,realIndex){
                        return AspectRatio(
                          aspectRatio: 1,
                          child: SvgPicture.asset(images[index],fit: BoxFit.cover,),
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
              ),
              SizedBox(
                height: 190,
                width: 600,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text('Tools I Use',style: GoogleFonts.poppins(fontSize: 23,color: AppColors.text,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: toolImages.length,
                      itemBuilder: (context,index,realIndex){
                        return AspectRatio(
                          aspectRatio: 1,
                          child: SvgPicture.asset(toolImages[index],fit: BoxFit.cover,),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
