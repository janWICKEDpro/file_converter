import 'package:file_picker/file_picker.dart';

class FilePickerMethods {
  //pick files single
  Future<FilePickerResult?> pickFile() async {
    final file = await FilePicker.platform.pickFiles();
    print(file!.names);
    return file;
  }

  //pick files multiple
  Future<FilePickerResult?> pickFiles() async {
    final file = await FilePicker.platform.pickFiles(allowMultiple: true);
    print(file!.names);
    return file;
  }
  //save files to folder

  //get files from folder
}
