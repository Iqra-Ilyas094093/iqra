import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/utils/device_type_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class feedbackSection extends StatefulWidget {
  final GlobalKey sectionkey;
  final Size size;

  const feedbackSection({
    super.key,
    required this.sectionkey,
    required this.size,
  });

  @override
  State<feedbackSection> createState() => _feedbackSectionState();
}

class _feedbackSectionState extends State<feedbackSection> {


List<Map<String,dynamic>> feedbackList = [];
TextEditingController nameController = TextEditingController();
TextEditingController feedbackController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFeedback();
  }


Future<void> fetchFeedback()async{
  final response = await Supabase.instance.client.from('feedback').select().order('created_at',ascending: false);
  print(response);
  setState(() {
    feedbackList = List<Map<String,dynamic>>.from(response);
  });
}

Future<void> submitFeedback()async{
  await Supabase.instance.client.from('feedback').insert({
    'name':nameController.text,
    'feedback':feedbackController.text,
  });
  nameController.clear();
  feedbackController.clear();
  await fetchFeedback();
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widget.sectionkey,
      height: widget.size.height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DeviceTypeHelper.isMobile(context)?SizedBox():Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
            child: Container(
              height: widget.size.height *0.85,
              width: DeviceTypeHelper.isTablet(context)?widget.size.width * 0.45:widget.size.width * 0.4,
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
                      child: feedbackList.isEmpty?Center(child: const Text('No feedback yet. Be the first')):ListView.builder(
                        itemCount: feedbackList.length,
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
                                            feedbackList[index]['name']??'',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: AppColors.text,
                                              height: 1,
                                            ),
                                          ),
                                          Text(
                                            feedbackList[index]['feedback']??'',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Container(
                height: widget.size.height * 0.85,
                width:double.infinity,
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
                        controller: nameController,
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
                        controller: feedbackController,
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
                      GestureDetector(
                        onTap: (){
                          if(nameController.text.isNotEmpty && feedbackController.text.isNotEmpty){
                           submitFeedback();
                          }
                        },
                        child: Container(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
