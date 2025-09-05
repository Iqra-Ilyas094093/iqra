import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/view/screen/desktop/ai_prompting.dart';
import 'package:iqra/view/screen/desktop/feedback.dart';
import 'package:iqra/view/screen/desktop/home.dart';
import 'package:iqra/view/screen/desktop/projects.dart';
import 'package:iqra/view/screen/desktop/skills.dart';
import 'package:iqra/view/widgets/hoverButton.dart';
import 'package:iqra/view/widgets/social_icon.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  bool isExpanded = false;
  ScrollController scrollController = ScrollController();
  int selectedIndex = 2;
  GlobalKey homekey = GlobalKey();
  GlobalKey skillkey = GlobalKey();
  GlobalKey projectkey = GlobalKey();
  GlobalKey aikey = GlobalKey();
  GlobalKey feedbackkey = GlobalKey();

  void onIconPress(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 1:
        scrollTo(homekey);
        break;
      case 2:
        scrollTo(projectkey);
        break;
      case 3:
        scrollTo(skillkey);
        break;
      case 4:
        scrollTo(aikey);
        break;
      case 5:
        scrollTo(feedbackkey);
        break;
    }
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
        key.currentContext!, duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  void onToggleIcon() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: isExpanded ? size.width * 0.19 : size.width * 0.1,
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
                                        name: 'Ai Prompt',
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
          Expanded(child: Scrollbar(
            thumbVisibility: true,
            thickness: 6,
            controller: scrollController,
            radius: Radius.circular(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              child: Column(
                children: [
                  Home(sectionkey: homekey, size: size),
                  Projects(sectionkey: projectkey, size: size,),
                  Skills(size: size, sectionKey: skillkey),
                  AiPrompting(sectionkey: aikey, size: size),
                  feedbackSection(sectionkey: feedbackkey, size: size),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}