import 'package:file_converter/data_layer/download_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit() : super(DownloadInitial());
  final downloadClass = DownloadClass();

  void download(String downloadLink) {}

  void emitDownloading() {
    emit(Downloading());
  }

  void emitDownloadCompleted() {
    emit(DownloadComplete());
  }

  void emitDownloadFailed() {
    emit(DownloadFailed());
  }
}
