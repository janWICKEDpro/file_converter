import 'dart:async';
import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_state.dart';
import 'package:file_converter/constants/enums.dart';

import 'package:file_converter/data_layer/cloud_convert/cloudconver_api_methods.dart';
import 'package:file_converter/data_layer/models/cloudconvert_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'file_conversion_state.dart';

class FileConversionCubit extends Cubit<FileConversionState> {
  final cloudConvertMethods = CloudConvertMethods();
  final FileState? fileState;
  StreamSubscription<FileState>? fileStateSubscription;

  FileConversionCubit({@required this.fileState})
      : super(FileConversionInitial()) {
    initialMethod(fileState!);
  }

  void initialMethod(FileState fileState) async {
    CloudConvertResponse? response;
    if (fileState.num == NumberOfFiles.single) {
      response = await cloudConvertMethods.convertFile(fileState);
      if (response.data["status"] == "finished") {
        conversionCompleted(response);
      } else {
        conversionFailed();
      }
    } else {
      List<String> links = await cloudConvertMethods.convertFiles(fileState);
      if (links.length == fileState.files.length) {
        conversionsCompleted(links);
      } else {
        conversionFailed();
      }
    }
  }

  void conversionCompleted(CloudConvertResponse response) {
    emit(FileConversionCompleted(
        downloadLink: response.data['tasks'][0]['result']['files'][1]['url']));
  }

  void conversionsCompleted(List<String> downloadLinks) {
    emit(FileConversionCompleted(downloadLinks: downloadLinks));
  }

  void conversionFailed() {
    emit(FileConversionFailed());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
