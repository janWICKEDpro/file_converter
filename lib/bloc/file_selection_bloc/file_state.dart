import 'package:file_converter/enums.dart';
import 'package:file_picker/file_picker.dart';

class FileState {
  NumberOfFiles? num;
  String? name;
  String? extension;
  List<PlatformFile?> files;

  FileState({required this.files, this.num, this.name, this.extension});
}
