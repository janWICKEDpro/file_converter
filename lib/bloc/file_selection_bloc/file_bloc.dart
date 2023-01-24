import 'dart:io';

import 'package:file_converter/business_logic/file_picker_methods.dart';
import 'package:file_converter/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_state.dart';

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileState(files: []));

  void pickFile() async {
    final filePicker = FilePickerMethods();
    final file = await filePicker.pickFile();
    emit(FileState(
        files: [file!],
        num: NumberOfFiles.single,
        name: filePicker.getFileName(file)));
  }

  void clearPickedFiles() async {
    emit(FileState(files: []));
  }
}
