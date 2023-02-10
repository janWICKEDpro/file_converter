import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// to handle downloading and storing the file in it rigt location
class DownloadClass {
  late String localPath;
  Future<bool> checkPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      print(status);
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String?> _findLocalPath() async {
    var directory = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();

        if (!await Directory('storage/emulated/0/Download/converter')
            .exists()) {
          Directory androidDir =
              await Directory('storage/emulated/0/Download/converter').create();
          return androidDir.path;
        }
      }
    }

    return '${directory.path}${Platform.pathSeparator}Download';
  }

  Future<void> prepareSaveDir() async {
    localPath = (await _findLocalPath())!;

    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }
}
