import 'package:url_launcher/url_launcher.dart';

Future<void> openVideo(String? videoUrl) async {
  print('entering video');
  if (videoUrl == null || videoUrl.isEmpty) {
    print('video does not exist');
    return;
  }

  print('video exists');
  final uri = Uri.tryParse(videoUrl);
  if (uri == null) return;

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
