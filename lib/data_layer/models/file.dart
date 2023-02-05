import 'package:file_converter/constants/enums.dart';
import 'package:file_picker/file_picker.dart';

class MyFile {
  PlatformFile? file;
  String? base64;
  FileExtensions? conversionExtension;
  MyFile({this.file, this.conversionExtension, this.base64});

  @override
  String toString() {
    return "MyFile( file: $file, extension: $conversionExtension, base64: $base64)";
  }
}
