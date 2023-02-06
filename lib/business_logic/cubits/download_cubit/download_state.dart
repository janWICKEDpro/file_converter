part of 'download_cubit.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class Downloading extends DownloadState {}

class DownloadComplete extends DownloadState {}

class DownloadFailed extends DownloadState {}
