import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/utils/device_type_helper.dart';
import 'package:iqra/view/widgets/widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatelessWidget {
  final GlobalKey sectionkey;
  final Size size;

  const Home({super.key, required this.sectionkey, required this.size});

  @override
  Widget build(BuildContext context) {
    List<String> num = ['1', '500', '300', '15'];
    List<String> text = [
      'Years of\nExperience',
      'Connect',
      'Commit',
      'Practice\nProjects',
    ];
    return SizedBox(
      height: size.height,
      width: double.infinity,
      key: sectionkey,
      child: Row(
        mainAxisAlignment: DeviceTypeHelper.isMobile(context)?MainAxisAlignment.center:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //main about section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40,),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: DeviceTypeHelper.isMobile(context)?CrossAxisAlignment.center:CrossAxisAlignment.start,
                  children: [
                    DeviceTypeHelper.isTablet(context)?SizedBox():SizedBox(height: 30,),
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
                    SizedBox(height: 25),
                    Text(
                      "I am Iqra",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: AppColors.text,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GradientText(
                      DeviceTypeHelper.isTablet(context)?'Flutter Dev':'Flutter Developer',
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
                    Text(
                      'A Passionate Flutter Developer building responsive, modern apps with clean architecture, APIs, and responsive design.',
                      style: GoogleFonts.poppins(
                        color: AppColors.text,
                        fontSize: 14,
                      ),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Wrap(
                        alignment: DeviceTypeHelper.isMobile(context)?WrapAlignment.center:WrapAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0,bottom: 4),
                            // cv button
                            child: Container(
                              height: 35,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.lightGreen),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_download,
                                    color: AppColors.text,
                                    size: 16,
                                  ),
                                  SizedBox(width: 1),
                                  Text(
                                    'Download CV',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SocialIcon(icon: FontAwesomeIcons.linkedin),
                                  SocialIcon(icon: FontAwesomeIcons.github),
                                  SocialIcon(icon: FontAwesomeIcons.discord),
                                  SocialIcon(icon: FontAwesomeIcons.x),
                                  SocialIcon(icon: Icons.mail),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          //about me section
         DeviceTypeHelper.isMobile(context)?SizedBox(): Expanded(
           child: Padding(
             padding: const EdgeInsets.only(
               left: 5,right: 5,top: 50,bottom: 10
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 DeviceTypeHelper.isTablet(context)?SizedBox(height: 10,):SizedBox(height: 40),
                 GradientText(
                   'About me',
                   colors: [Colors.lightGreen, Colors.lightGreenAccent],
                   style: GoogleFonts.poppins(
                     fontWeight: FontWeight.bold,
                     fontSize: 35,
                   ),
                 ),
                 SizedBox(height: 10),
                 Text(
                   "I'm a Flutter developer crafting fast, elegant mobile apps with a focus on clean UI, smooth UX, and performance. Driven by curiosity and a love for learning, I constantly explore new tools and techniques to improve my work. I enjoy building intuitive experiences that people genuinely enjoy using. Let’s create something impactful together.",
                   style: GoogleFonts.poppins(
                     fontSize: 15,
                     color: AppColors.textMuted,
                   ),
                 ),
                 SizedBox(height: 15),
                 SizedBox(
                   height: 150,
                   width: double.infinity,
                   child: GridView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 2,
                       mainAxisSpacing: 2,
                       mainAxisExtent: 75,
                       // childAspectRatio: 90,
                     ),
                     itemCount: num.length,
                     itemBuilder: (context, index) {
                       return Numandtextcontainer(
                         num: num[index],
                         text: text[index],
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
         ),
        ],
      ),
    );
  }
}
