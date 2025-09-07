import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/device_type_helper.dart';
import 'package:iqra/view/widgets/skills_carousel_builder.dart';
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
    return SizedBox(
      key: widget.sectionKey,
      height: widget.size.height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          DeviceTypeHelper.isTablet(context)?SizedBox():GradientText(
            'Skills', colors: [Colors.lightGreen, Colors.lightGreenAccent],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 40,),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DeviceTypeHelper.isTablet(context)?GradientText(
                'Skills', colors: [Colors.lightGreen, Colors.lightGreenAccent],
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 40,),):SizedBox(),
              SkillsCarouselBuilder(imagesList: images, headlineText: 'Languages & Framework'),
              SkillsCarouselBuilder(imagesList: toolImages, headlineText: 'Tools I use'),
            ],
          ),
        ],
      ),
    );
  }
}
