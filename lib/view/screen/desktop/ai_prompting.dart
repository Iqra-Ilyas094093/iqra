import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/utils/colors.dart';
import 'package:iqra/utils/prompt_file.dart';
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
          SizedBox(height: 25),
          Promptcontainer(
            num: '1',
            text: 'Text prompt',
            previewFunction: () {},
            promptFunction: () {
              promptDialog(Prompts.textPrompt);
            },
          ),
          Promptcontainer(
            num: '2',
            text: 'Code Prompt',
            previewFunction: () {},
            promptFunction: () {
              promptDialog(Prompts.codePrompt);
            },
          ),
          Promptcontainer(
            num: '3',
            text: 'Full Ui App in 1 Prompt',
            previewFunction: () {},
            promptFunction: () {
              promptDialog(Prompts.advanceUiPrompt);
            },
          ),
        ],
      ),
    );
  }

  void promptDialog(String textPrompt) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(textPrompt),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(child: Text('Back to Home')),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: ()async {
                          await Clipboard.setData(ClipboardData(text: textPrompt));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Text Copied to Clipboard')));
                        },
                        child: Center(child: Text('Copy Prompt')),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
