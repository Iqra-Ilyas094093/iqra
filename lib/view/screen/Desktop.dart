import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/view/widgets/hoverButton.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  bool isHovered = false;
  int selectedIndex = 1;
  bool isExpanded = false;

  void onIconPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onToggleIcon() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Row(
        children: [
          //first header row
          SizedBox(
            height: double.infinity,
            width: isExpanded ? size.width * 0.17 : size.width * 0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 60,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: isExpanded ? size.width * 0.17 : size.width * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderMuted),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onToggleIcon(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isExpanded
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_forward_ios,
                                color: AppColors.text,
                              ),
                              isExpanded
                                  ? Text(
                                      'Swipe',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints
                                      .maxHeight, // make it fill sidebar height
                                ),
                                child: IntrinsicHeight(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // 👈 centers vertically
                                    children: [
                                      Hoverbutton(
                                        icon: Icons.home,
                                        name: 'Home',
                                        index: 1,
                                        filledIcon: Icons.home_outlined,
                                        size: size,
                                        onIconPress: () => onIconPress(1),
                                        isExpanded: isExpanded,
                                        selectedIndex: selectedIndex,
                                      ),
                                      Hoverbutton(
                                        icon: Icons.folder_copy,
                                        name: 'Projects',
                                        index: 2,
                                        filledIcon: Icons.folder_copy_outlined,
                                        size: size,
                                        onIconPress: () => onIconPress(2),
                                        isExpanded: isExpanded,
                                        selectedIndex: selectedIndex,
                                      ),
                                      Hoverbutton(
                                        icon: Icons.build_rounded,
                                        name: 'Skills',
                                        index: 3,
                                        filledIcon: Icons.build_outlined,
                                        size: size,
                                        onIconPress: () => onIconPress(3),
                                        isExpanded: isExpanded,
                                        selectedIndex: selectedIndex,
                                      ),
                                      Hoverbutton(
                                        icon: Icons.smart_toy,
                                        name: 'Ai Prompting',
                                        index: 4,
                                        filledIcon: Icons.smart_toy_outlined,
                                        size: size,
                                        onIconPress: () => onIconPress(4),
                                        isExpanded: isExpanded,
                                        selectedIndex: selectedIndex,
                                      ),
                                      Hoverbutton(
                                        icon: Icons.feedback,
                                        name: 'Feedback',
                                        index: 5,
                                        filledIcon: Icons.feedback_outlined,
                                        size: size,
                                        onIconPress: () => onIconPress(5),
                                        isExpanded: isExpanded,
                                        selectedIndex: selectedIndex,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // about me section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 70),
            child: Container(
              height: double.infinity,
              width: size.width * 0.35,
              // color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightGreen.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset('assets/images/new.png'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "I am Iqra",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColors.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GradientText(
                    'Flutter Developer',
                    colors: [
                      Colors.lightGreen,
                      Colors.lightGreen.withOpacity(0.5),
                      Colors.lightGreen.withOpacity(0.9),
                    ],
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    'A Passionate Flutter Developer building responsive, modern apps with clean architecture, APIs, and responsive design. Always learning, always building.',
                  style: GoogleFonts.poppins(color: AppColors.text,fontSize: 14,),
                    softWrap: true,
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.lightGreen,)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.file_download,color:AppColors.text,size: 16,),
                            SizedBox(width: 1,),
                            Text('Download CV',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.text),)
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            socialIcon(FontAwesomeIcons.linkedin),
                            socialIcon(FontAwesomeIcons.github),
                            socialIcon(FontAwesomeIcons.discord),
                            socialIcon(FontAwesomeIcons.x),
                            socialIcon(Icons.mail),
                          ],
                        ),
                      )

                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget socialIcon(IconData icon){
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.lightGreen)),
      child: Center(child: FaIcon(icon,color: Colors.lightGreen,size: 16,)),
    );
  }
}
