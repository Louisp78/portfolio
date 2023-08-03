import 'package:url_launcher/url_launcher.dart';

void visitUrl({required String url}) async {
  try {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  } catch (e) {
    throw 'Could not launch $url';
  }
}