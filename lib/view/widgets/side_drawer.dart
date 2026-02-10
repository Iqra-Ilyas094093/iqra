import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/view/widgets/widgets.dart';
import 'package:iqra/view_model/view_model.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {

  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<SideDrawerProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return  SizedBox(
      height: double.infinity,
      width: drawerProvider.isExpanded ? size.width * 0.15 : size.width * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 60,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: drawerProvider.isExpanded ? size.width * 0.15 : size.width * 0.1,
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
                  onTap: () => drawerProvider.onToggleIcon(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          drawerProvider.isExpanded
                              ? Icons.arrow_back_ios
                              : Icons.arrow_forward_ios,
                          color: AppColors.text,
                        ),
                        drawerProvider.isExpanded
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
                                .maxHeight,
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
                                  onIconPress: () => drawerProvider.onIconPress(1),
                                  isExpanded: drawerProvider.isExpanded,
                                  selectedIndex: drawerProvider.selectedIndex,
                                ),
                                Hoverbutton(
                                  icon: Icons.folder_copy,
                                  name: 'Project',
                                  index: 2,
                                  filledIcon: Icons.folder_copy_outlined,
                                  size: size,
                                  onIconPress: () => drawerProvider.onIconPress(2),
                                  isExpanded: drawerProvider.isExpanded,
                                  selectedIndex: drawerProvider.selectedIndex,
                                ),
                                Hoverbutton(
                                  icon: Icons.build_rounded,
                                  name: 'Skills',
                                  index: 3,
                                  filledIcon: Icons.build_outlined,
                                  size: size,
                                  onIconPress: () => drawerProvider.onIconPress(3),
                                  isExpanded: drawerProvider.isExpanded,
                                  selectedIndex: drawerProvider.selectedIndex,
                                ),
                                Hoverbutton(
                                  icon: Icons.feedback,
                                  name: 'Review',
                                  index: 4,
                                  filledIcon: Icons.feedback_outlined,
                                  size: size,
                                  onIconPress: () => drawerProvider.onIconPress(4),
                                  isExpanded: drawerProvider.isExpanded,
                                  selectedIndex: drawerProvider.selectedIndex,
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
    );
  }
}
