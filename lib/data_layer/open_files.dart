import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

Future openFile(PlatformFile convertedFile) async {
  final Uri uri = Uri.file(convertedFile.path!);
  if (!File(uri.toFilePath()).existsSync()) {
    throw Exception('$uri does not exist!');
  }
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
