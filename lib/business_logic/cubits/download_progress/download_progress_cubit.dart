import 'package:file_converter/business_logic/cubits/download_progress/download_progress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadProgressCubit extends Cubit<DownloadProgressState> {
  DownloadProgressCubit() : super(DownloadProgressState(0));

  void emitProgress(int received, int total) {
    emit(DownloadProgressState(received / total));
  }
}
