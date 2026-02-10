import 'package:flutter/material.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/view/screen/desktop/all.dart';
import 'package:iqra/view/widgets/side_drawer.dart';
import 'package:iqra/view/widgets/widgets.dart';
import 'package:iqra/view_model/view_model.dart';
import 'package:provider/provider.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SideDrawerProvider>(context);
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.bgDark,
        child:  SideDrawer(),
      ),
      body:  SizedBox.expand(child: Scrollbar(
        thumbVisibility: true,
        thickness: 6,
        controller: provider.scrollController,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: provider.scrollController,
          child: Column(
            children: [
              Home(sectionkey: provider.homeKey, size: size),
              Projects(sectionkey: provider.projectKey, size: size,),
              Skills(size: size, sectionKey: provider.skillKey),
              // AiPrompting(sectionkey:provider.aiKey, size: size),
              feedbackSection(sectionkey: provider.feedbackKey, size: size),
            ],
          ),
        ),
      )),
    );
  }
}
