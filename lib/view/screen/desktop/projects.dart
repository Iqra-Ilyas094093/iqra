import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/utils/network_images.dart';
import 'package:iqra/view/widgets/widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Projects extends StatelessWidget {
 final  ScrollController scrollController = ScrollController();
  final GlobalKey sectionkey;
  final Size size;

  Projects({super.key, required this.sectionkey, required this.size});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        key: sectionkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: GradientText(
                'Projects', colors: [Colors.lightGreen, Colors.lightGreenAccent],
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 35,),),
            ),
            Center(
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                isScrollable:true,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                indicator: BoxDecoration(
                  color: Colors.lightGreenAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)
                ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(20),
                  indicatorWeight: 3,
                  unselectedLabelColor: AppColors.text,
                  indicatorColor: Colors.lightGreenAccent,
                  labelColor: Colors.lightGreen,
                  labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 18),
                  tabs: [
                Tab(text: 'Ui Clone',),
                Tab(text: 'Api Integration',),
                Tab(text: 'Supabase',),
                Tab(text: 'Full App',),
              ]),
            ),
           SizedBox(
             height: 450,
             width: size.width * 0.7,
             child: TabBarView(children: [
              ScrollConfiguration(
                behavior: MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  }
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Weather App'),
                      ProjectBox(imageUrl: NetworkImages.whatsappApp, name: 'WhatsApp Clone'),
                      ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Facebook Clone'),
                    ],
                  ),
                ),
              ),
               ScrollConfiguration(
                 behavior: MaterialScrollBehavior().copyWith(
                     dragDevices: {
                       PointerDeviceKind.touch,
                       PointerDeviceKind.mouse,
                     }
                 ),
                 child: SingleChildScrollView(
                   controller: scrollController,
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Weather App'),
                       ProjectBox(imageUrl: NetworkImages.whatsappApp, name: 'WhatsApp Clone'),
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Facebook Clone'),
                     ],
                   ),
                 ),
               ),
               ScrollConfiguration(
                 behavior: MaterialScrollBehavior().copyWith(
                     dragDevices: {
                       PointerDeviceKind.touch,
                       PointerDeviceKind.mouse,
                     }
                 ),
                 child: SingleChildScrollView(
                   controller: scrollController,
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Weather App'),
                       ProjectBox(imageUrl: NetworkImages.whatsappApp, name: 'WhatsApp Clone'),
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Facebook Clone'),
                     ],
                   ),
                 ),
               ),
               ScrollConfiguration(
                 behavior: MaterialScrollBehavior().copyWith(
                     dragDevices: {
                       PointerDeviceKind.touch,
                       PointerDeviceKind.mouse,
                     }
                 ),
                 child: SingleChildScrollView(
                   controller: scrollController,
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Weather App'),
                       ProjectBox(imageUrl: NetworkImages.whatsappApp, name: 'WhatsApp Clone'),
                       ProjectBox(imageUrl: NetworkImages.weatherApp, name: 'Facebook Clone'),
                     ],
                   ),
                 ),
               ),
             ]),
           ),
          ],
        ),
      ),
    );
  }
}
