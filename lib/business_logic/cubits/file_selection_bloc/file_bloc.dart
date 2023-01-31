import 'dart:convert';

import 'package:file_converter/data/models/file.dart';
import 'package:file_converter/data/file_picker_methods.dart';
import 'package:file_converter/constants/enums.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_state.dart';

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileState(files: []));

  void pickFile() async {
    final filePicker = FilePickerMethods();
    final file = await filePicker.pickFile();
    if (file != null) {
      final uint8list = file.bytes;
      String base64 = base64Encode(uint8list!.toList());
      emit(
        FileState(
          files: [
            MyFile(
              file: file,
              conversionExtension: FileExtensions.none,
              base64: base64,
            )
          ],
          num: NumberOfFiles.single,
          name: filePicker.getFileName(file),
          extension: filePicker.getExtension(file),
        ),
      );
    } else {
      print("Emit other state");
    }
  }

  void pickFiles() async {
    final filePicker = FilePickerMethods();
    final file = await filePicker.pickFiles();

    emit(FileState(
      files: [
        ...file.map(
          (e) => MyFile(
            file: e!,
            conversionExtension: FileExtensions.none,
            base64: base64Encode(e.bytes!.toList()),
          ),
        )
      ],
      num: NumberOfFiles.multiple,
      names: filePicker.getFileNames(file),
      extensions: filePicker.getExtensions(file),
    ));
  }

  void setConversionExtension(FileExtensions extensions, int index) {
    state.files[index].conversionExtension = extensions;
    emit(state);
  }

  void clearPickedFiles() async {
    emit(FileState(files: []));
  }
}
