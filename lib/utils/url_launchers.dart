import 'package:url_launcher/url_launcher.dart';

class UrlLaunchers{
  static Future<void> launchUrlLink(String url)async{
    final Uri uri = Uri.parse(url);
    if(!await launchUrl(uri,mode: LaunchMode.externalApplication )){
      print('error opening your link');
      throw Exception('Error linking to the profile');
    }
  }
  static Future<void> launchEmailLink(String email)async{
    final Uri uri = Uri(scheme: 'mailto',path:email,query: "subject=Hello Iqra&body=I want to connect with you!" );
    if(!await launchUrl(uri,mode: LaunchMode.externalApplication)){
      print('error opening your link');
      throw Exception('Failed to connect to email');
    }
  }
}