import 'package:file_converter/business_logic/cubits/download_progress/download_progress_cubit.dart';
import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_state.dart';
import 'package:file_converter/data_layer/cloud_convert/cloudconvert_api_methods.dart';

import 'package:file_converter/data_layer/download_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit(this.downloadProgress) : super(DownloadInitial());
  final downloadClass = DownloadClass();
  final cloudConvert = CloudConvertMethods();
  final DownloadProgressCubit? downloadProgress;

  void download(String downloadLink, String name) async {
    var dio = Dio();

    await downloadClass.prepareSaveDir();
    emitDownloading();
    try {
      await dio.download(
        downloadLink,
        "${downloadClass.localPath}/$name",
        onReceiveProgress: (count, total) {
          downloadProgress?.emitProgress(count, total);
        },
      );
      emitDownloadCompleted();
    } catch (e) {
      print(e);
      emitDownloadFailed();
    }
  }

  void downloadFiles(List<String> links, FileState files) async {
    var dio = Dio();

    await downloadClass.prepareSaveDir();
    emitDownloading();
    for (var i = 0; i < links.length; i++) {
      try {
        await dio.download(
          links[i],
          "${downloadClass.localPath}/${cloudConvert.newFileName(files, i)}",
          onReceiveProgress: (count, total) {
            downloadProgress?.emitProgress(count, total);
          },
        );
      } catch (e) {
        print(e);
        emitDownloadFailed();
        return;
      }
    }
    emitDownloadCompleted();
  }

  void emitDownloading() {
    emit(Downloading());
  }

  void emitDownloadCompleted() {
    emit(DownloadComplete());
  }

  void emitDownloadFailed() {
    emit(DownloadFailed());
  }

  @override
  Future<void> close() {
    downloadProgress?.close();
    return super.close();
  }
}
