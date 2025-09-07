import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;

  const SocialIcon({super.key, required this.icon});

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
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
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isHovered?Colors.lightGreen.withOpacity(0.3):Colors.transparent,
          border: Border.all(color: Colors.lightGreen),
        ),
        child: Center(
          child: FaIcon(widget.icon, color: Colors.lightGreen, size: 16),
        ),
      ),
    );
  }
}
