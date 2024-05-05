part of 'history_bloc.dart';

class HistoryState {
  final List<FileSystemEntity>? convertedFiles;
  final History? loading;
  final bool? permitted;
  HistoryState({this.convertedFiles, this.loading, this.permitted});

  HistoryState copyWith(
      {List<FileSystemEntity>? convertedFiles,
      History? loading,
      bool? permitted}) {
    return HistoryState(
        convertedFiles: convertedFiles ?? this.convertedFiles,
        loading: loading ?? this.loading,
        permitted: permitted ?? this.permitted);
  }
}
