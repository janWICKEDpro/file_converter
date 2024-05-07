import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future openFile(FileSystemEntity convertedFile) async {
  final url = convertedFile.path;

  final Uri uri = Uri.file(url);
  if (!File(uri.toFilePath()).existsSync()) {
    throw Exception('$uri does not exist!');
  }
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $uri');
  }
}
