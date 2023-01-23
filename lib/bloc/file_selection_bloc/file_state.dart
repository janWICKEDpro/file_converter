import 'package:file_converter/business_logic/file.dart';
import 'package:file_converter/enums.dart';

class FileState {
  NumberOfFiles? num;
  List<MyFile>? files;

  FileState({this.files, this.num});
}
