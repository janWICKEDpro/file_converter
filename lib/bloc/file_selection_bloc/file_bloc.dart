import 'dart:io';

import 'package:file_converter/business_logic/file.dart';
import 'package:file_converter/business_logic/file_picker_methods.dart';
import 'package:file_converter/enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_state.dart';

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileState(files: []));

  void pickFile() async {
    final filePicker = FilePickerMethods();
    final file = await filePicker.pickFile();
    emit(FileState(
        files: [MyFile(file: file!, conversionExtension: FileExtensions.none)],
        num: NumberOfFiles.single,
        name: filePicker.getFileName(file),
        extension: filePicker.getExtension(file)));
  }

  void pickFiles() async {
    final filePicker = FilePickerMethods();
    final file = await filePicker.pickFiles();
    emit(FileState(
        files: [
          ...file.map(
              (e) => MyFile(file: e!, conversionExtension: FileExtensions.none))
        ],
        num: NumberOfFiles.multiple,
        names: filePicker.getFileNames(file),
        extensions: filePicker.getExtensions(file)));
  }

  void setConversionExtension(FileExtensions extensions, int index) {
    state.files[index].conversionExtension = extensions;
    emit(state);
  }

  void clearPickedFiles() async {
    emit(FileState(files: []));
  }
}
