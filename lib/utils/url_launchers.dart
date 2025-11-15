import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchers{
  static Future<void> launchUrlLink(String url)async{
    final Uri uri = Uri.parse(url);
    if(!await launchUrl(uri,mode: LaunchMode.externalApplication )){
      print('error opening your link');
      throw Exception('Error linking to the profile');
    }
  }
  static Future<void> launchEmailLink(String email) async {
    const String subjectText = "Hello Iqra";
    const String bodyText = "I want to connect with you!";

    // Encode for URLs
    final String subject = Uri.encodeComponent(subjectText);
    final String body = Uri.encodeComponent(bodyText);

    if (kIsWeb) {
      // 🔵 Web → Always open Gmail Web compose window
      final Uri gmailWebUrl = Uri.parse(
          "https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$subject&body=$body"
      );

      if (!await launchUrl(gmailWebUrl, mode: LaunchMode.externalApplication)) {
        throw Exception("Could not launch Gmail Web");
      }
    } else {
      // 🔵 Mobile/Desktop → Use mailto:
      final Uri mailToUrl = Uri(
        scheme: 'mailto',
        path: email,
        query: "subject=$subject&body=$body",
      );

      if (!await launchUrl(mailToUrl)) {
        throw Exception("Could not launch mail app");
      }
    }
  }

}