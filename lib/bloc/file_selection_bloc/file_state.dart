// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:file_converter/business_logic/file.dart';
import 'package:file_converter/enums.dart';

class FileState {
  NumberOfFiles? num;
  String? name;
  List<String>? names;
  List<FileExtensions?>? extensions;
  FileExtensions? extension;
  List<MyFile> files;

  FileState({
    required this.files,
    this.num,
    this.name,
    this.names,
    this.extensions,
    this.extension,
  });

  @override
  String toString() {
    return "${files},${num}, ${name}, ${names}, ${extension}, $extensions";
  }
}
