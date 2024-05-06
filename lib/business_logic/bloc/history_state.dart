part of 'history_bloc.dart';

class HistoryState {
  final List<FileSystemEntity>? convertedFiles;
  final HistoryLoadState? loading;
  final bool? permitted;
  HistoryState({this.convertedFiles, this.loading, this.permitted});

  HistoryState copyWith(
      {List<FileSystemEntity>? convertedFiles,
      HistoryLoadState? loading,
      bool? permitted}) {
    return HistoryState(
        convertedFiles: convertedFiles ?? this.convertedFiles,
        loading: loading ?? this.loading,
        permitted: permitted ?? this.permitted);
  }
}
