import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iqra/utils/social_links.dart';
import 'package:iqra/utils/url_launchers.dart';
import 'package:iqra/view/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksBox extends StatefulWidget {
  UrlLaunchers urlLaunchers = UrlLaunchers();
  SocialLinksBox({super.key});

  @override
  State<SocialLinksBox> createState() => _SocialLinksBoxState();
}

class _SocialLinksBoxState extends State<SocialLinksBox> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialIcon(icon: FontAwesomeIcons.linkedin,onTap: ()async{await UrlLaunchers.launchUrlLink(SocialLinks.linkedInLink);}),
            SocialIcon(icon: FontAwesomeIcons.github,onTap: ()async{await UrlLaunchers.launchUrlLink(SocialLinks.linkedInLink);}),
            SocialIcon(icon: FontAwesomeIcons.discord,onTap: ()async{await UrlLaunchers.launchUrlLink(SocialLinks.linkedInLink);}),
            SocialIcon(icon: FontAwesomeIcons.x,onTap: ()async{await UrlLaunchers.launchUrlLink(SocialLinks.linkedInLink);}),
            SocialIcon(icon: Icons.mail,onTap: ()async{await UrlLaunchers.launchEmailLink(SocialLinks.mailLink);}),
          ],
        ),
      ),
    );
  }
}
