import 'package:file_converter/enums.dart';
import 'package:file_picker/file_picker.dart';

class MyFile {
  PlatformFile? file;
  FileExtensions? conversionExtension;
  MyFile({this.file, this.conversionExtension});

  @override
  String toString() {
    return "MyFile( file: $file, extension: $conversionExtension)";
  }
}
