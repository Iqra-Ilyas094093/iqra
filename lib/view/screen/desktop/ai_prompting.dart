import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/view/widgets/promptContainer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AiPrompting extends StatefulWidget {
  final GlobalKey sectionkey;
  final Size size;

  const AiPrompting({super.key, required this.sectionkey, required this.size});

  @override
  State<AiPrompting> createState() => _AiPromptingState();
}

class _AiPromptingState extends State<AiPrompting> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widget.sectionkey,
      height: widget.size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientText(
            'Prompt Engineer',
            colors: [Colors.lightGreen, Colors.lightGreenAccent],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          SizedBox(height: 25,),
          Promptcontainer(num: '1', text: 'Flutter Development'),
          Promptcontainer(num: '2', text: 'Documentation'),
          Promptcontainer(num: '3', text: 'Debugging'),
        ],
      ),
    );
  }
}
