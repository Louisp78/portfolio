import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({required String email}) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email, // Replace with the email address
    queryParameters: {'subject': 'J\'ai besoin de renseignements'}, // Optional: Subject for the email
  );
  try {
    await launchUrl(emailUri);
  } catch (e) {
    throw 'Could not launch email link';
  }
}
