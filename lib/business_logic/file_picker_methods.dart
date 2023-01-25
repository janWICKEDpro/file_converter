import 'package:file_picker/file_picker.dart';

class FilePickerMethods {
  //pick files single
  Future<PlatformFile?> pickFile() async {
    final file = await FilePicker.platform.pickFiles();
    PlatformFile finalFile = file!.files.single;
    return finalFile;
  }

  String getFileName(PlatformFile? file) {
    return file!.name.substring(0, file.name.lastIndexOf("."));
  }

  List<String> getFileNames(List<PlatformFile?> files) {
    return files.map((file) => getFileName(file)).toList();
  }

  String getExtension(PlatformFile? file) {
    return file!.name.substring(file.name.lastIndexOf("."));
  }

  List<String> getExtensions(List<PlatformFile?> files) {
    return files.map((file) => getExtension(file)).toList();
  }

  //pick files multiple
  Future<List<PlatformFile?>> pickFiles() async {
    final file = await FilePicker.platform.pickFiles(allowMultiple: true);
    return file!.files;
  }

  //save files to folder

  //get files from folder
}
