part of 'file_conversion_cubit.dart';

@immutable
abstract class FileConversionState {}

class FileConversionInitial extends FileConversionState {}

class FileConversionCompleted extends FileConversionState {
  final String? downloadLink;
  final String? fileName;
  final List<String>? downloadLinks;
  FileConversionCompleted(
      {this.downloadLink, this.downloadLinks, this.fileName});
}

class FileConversionFailed extends FileConversionState {}
