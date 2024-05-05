part of 'history_bloc.dart';

class HistoryState {
  final List<File>? convertedFiles;
  final bool? loading;
  HistoryState({this.convertedFiles, this.loading});

  HistoryState copyWith({List<File>? convertedFiles, loading}) {
    return HistoryState(
        convertedFiles: convertedFiles ?? this.convertedFiles,
        loading: loading ?? this.loading);
  }
}
