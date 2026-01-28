import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class LinkService {
  static const String linkedin = 'https://www.linkedin.com/in/peterzma';
  static const String github = 'https://github.com/chuckabox';
  static const String bugReport = 'https://docs.google.com/forms/d/e/1FAIpQLSeTSDNdbh0e0pl3-IbcI9aXB-3vqUnG__bQR57T2AOmz-PgsQ/viewform?usp=pp_url&entry.1189187296=Bug+Report';
  static const String feedback = 'https://docs.google.com/forms/d/e/1FAIpQLSeTSDNdbh0e0pl3-IbcI9aXB-3vqUnG__bQR57T2AOmz-PgsQ/viewform?usp=pp_url&entry.1189187296=Feedback';

  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      debugPrint('Could not launch $url');
    }
  }
}