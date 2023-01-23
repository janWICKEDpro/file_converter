import 'package:file_converter/enums.dart';
import 'package:file_picker/file_picker.dart';

class FileState {
  NumberOfFiles? num;
  List<PlatformFile>? files;

  FileState({this.files, this.num});
}
