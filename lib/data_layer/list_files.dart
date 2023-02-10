import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

List<FileSystemEntity> listFiles() {
  String directory = "";
  if (Platform.isAndroid) {
    directory = "/storage/emulated/0/Download/converter";

    if (!Directory(directory).existsSync()) {
      Directory(directory).createSync();
    }
  }
  return Directory(directory).listSync();
}
