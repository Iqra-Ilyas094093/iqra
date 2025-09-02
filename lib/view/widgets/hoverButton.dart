import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';

class Hoverbutton extends StatefulWidget {
  final IconData icon;
  final String name;
  final int index;
  final IconData filledIcon;
  final Size size;
  VoidCallback onIconPress;
  final bool isExpanded;
  final int selectedIndex;

  Hoverbutton({
    super.key,
    required this.icon,
    required this.name,
    required this.index,
    required this.filledIcon,
    required this.size,
    required this.onIconPress,
    required this.isExpanded,
    required this.selectedIndex,
  });

  @override
  State<Hoverbutton> createState() => _HoverbuttonState();
}

class _HoverbuttonState extends State<Hoverbutton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovered = true;
      }),
      onExit: (_) => setState(() {
        isHovered = false;
      }),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        highlightColor: AppColors.highlight,
        hoverColor: AppColors.highlight,
        hoverDuration: Duration(seconds: 1),
        onTap: widget.onIconPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(0, isHovered ? -5 : 0, 0),
            height: 40,
            width: widget.isExpanded ? widget.size.width * 0.15 : widget.size.width * 0.09,
            decoration: BoxDecoration(
              border: Border.all(
                color: isHovered ? AppColors.border : AppColors.borderMuted,
              ),
              borderRadius: BorderRadius.circular(5),
              color: isHovered ? AppColors.highlight : AppColors.bgLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.selectedIndex == widget.index
                    ? Icon(widget.icon, color: isHovered?Colors.white:AppColors.textMuted)
                    : Icon(widget.filledIcon, color: isHovered?Colors.white:AppColors.textMuted),
                widget.isExpanded ? SizedBox(width: 10) : SizedBox(),
                widget.isExpanded
                    ? Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                          color: isHovered ? Colors.white : AppColors.textMuted,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
