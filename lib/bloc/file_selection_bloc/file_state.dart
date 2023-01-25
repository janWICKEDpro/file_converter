import 'package:file_converter/enums.dart';
import 'package:file_picker/file_picker.dart';

class FileState {
  NumberOfFiles? num;
  FileExtensions conversionExtension;
  String? name;
  List<String>? names;
  List<String>? extensions;
  String? extension;
  List<PlatformFile?> files;

  FileState(
      {required this.files,
      this.num,
      this.name,
      this.names,
      this.extensions,
      this.extension,
      this.conversionExtension = FileExtensions.none});
}
