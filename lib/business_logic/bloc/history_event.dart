part of 'history_bloc.dart';

sealed class HistoryEvent {}

class Init extends HistoryEvent {}

class OnFileClicked extends HistoryEvent {}

class OnRequestPermissions extends HistoryEvent {}
