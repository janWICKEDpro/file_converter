import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerMethods {
  //pick files single
  Future<PlatformFile?> pickFile() async {
    final file = await FilePicker.platform.pickFiles(withData: true);
    PlatformFile finalFile = file!.files.single;
    return finalFile;
  }

  String getFileName(PlatformFile? file) {
    return file!.name.substring(0, file.name.lastIndexOf("."));
  }

  List<String> getFileNames(List<PlatformFile?> files) {
    return files.map((file) => getFileName(file)).toList();
  }

  FileExtensions? getExtension(PlatformFile? file) {
    return extensionMap[
        file!.name.substring(file.name.lastIndexOf(".") + 1).toLowerCase()];
  }

  List<FileExtensions?>? getExtensions(List<PlatformFile?> files) {
    return files.map((file) => getExtension(file)).toList();
  }

  //pick files multiple
  Future<List<PlatformFile?>> pickFiles() async {
    final file = await FilePicker.platform
        .pickFiles(allowMultiple: true, withData: true);
    return file!.files;
  }
}
