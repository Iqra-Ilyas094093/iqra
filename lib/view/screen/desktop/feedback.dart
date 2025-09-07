import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/utils/device_type_helper.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class feedbackSection extends StatelessWidget {
  final GlobalKey sectionkey;
  final Size size;

  const feedbackSection({
    super.key,
    required this.sectionkey,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: sectionkey,
      height: size.height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
            child: Container(
              height: size.height *0.85,
              width: DeviceTypeHelper.isTablet(context)?size.width * 0.45:size.width * 0.35,
              decoration: BoxDecoration(
                // color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.highlight),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GradientText(
                      'Feedback',
                      colors: [Colors.lightGreen, Colors.lightGreenAccent],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior().copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8,
                            ),
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.bg,
                                border: Border.all(color: AppColors.highlight),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Username',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: AppColors.text,
                                              height: 1,
                                            ),
                                          ),
                                          Text(
                                            'Improve the color scheme a bit morehfsfasdkhfskhdfkshfkshdfkhsdfkshdfkhsdfkhsfssdljfajslfjs;ljfsldjfsldjfsjd',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: AppColors.textMuted,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //enter your valuable feedback
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
            child: Container(
              height: size.height * 0.85,
              width: DeviceTypeHelper.isTablet(context)?size.width * 0.45:size.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter your valuable Feedback,',
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.lightGreen,
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.bg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none
                        ),
                        hintText: 'Enter name',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.lightGreen,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.bg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none
                        ),
                        hintText: 'Enter your feedback here...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: GradientText(
                          'Submit',
                          colors: [Colors.lightGreen, Colors.lightGreen],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
