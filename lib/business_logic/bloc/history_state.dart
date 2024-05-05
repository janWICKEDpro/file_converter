part of 'history_bloc.dart';

class HistoryState {
  final List<FileSystemEntity>? convertedFiles;
  final bool? loading;
  HistoryState({this.convertedFiles, this.loading});

  HistoryState copyWith({List<FileSystemEntity>? convertedFiles, loading}) {
    return HistoryState(
        convertedFiles: convertedFiles ?? this.convertedFiles,
        loading: loading ?? this.loading);
  }
}
