import 'dart:io';

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
