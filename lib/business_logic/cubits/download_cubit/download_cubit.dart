import 'package:file_converter/data_layer/cloud_convert/cloudconvert_api_methods.dart';
import 'package:file_converter/data_layer/download_methods.dart';
import 'package:file_converter/data_layer/models/cloudconvert_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit() : super(DownloadInitial());
  final downloadClass = DownloadClass();

  void download(String downloadLink, String name) async {
    var dio = Dio();

    await downloadClass.prepareSaveDir();
    emitDownloading();
    try {
      await dio.download(downloadLink, "${downloadClass.localPath}/$name");
      emitDownloadCompleted();
    } catch (e) {
      print(e);
      emitDownloadFailed();
    }
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
}
