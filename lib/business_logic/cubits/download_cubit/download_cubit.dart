import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit() : super(DownloadInitial());

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
