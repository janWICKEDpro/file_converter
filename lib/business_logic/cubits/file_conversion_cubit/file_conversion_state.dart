part of 'file_conversion_cubit.dart';

@immutable
abstract class FileConversionState {}

class FileConversionInitial extends FileConversionState {}

class FileConversionCompleted extends FileConversionState {
  final String? downloadLink;
  final List<String>? downloadLinks;
  FileConversionCompleted({this.downloadLink, this.downloadLinks});
}

class FileConversionFailed extends FileConversionState {}
