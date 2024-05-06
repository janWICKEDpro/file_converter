part of 'history_bloc.dart';

sealed class HistoryEvent {}

class Init extends HistoryEvent {}

class OnFileClicked extends HistoryEvent {
  final FileSystemEntity file;
  OnFileClicked({required this.file});
}

class OnRequestPermissions extends HistoryEvent {}
