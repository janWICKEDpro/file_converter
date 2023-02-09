import 'dart:io';
import 'package:path_provider/path_provider.dart';

List<FileSystemEntity> listFiles() {
  String directory = "";
  if (Platform.isAndroid) {
    directory = "/storage/emulated/0/Download/converter";
  }
  return Directory(directory).listSync();
}
