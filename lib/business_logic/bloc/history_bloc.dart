import 'dart:io';
import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/data_layer/list_files.dart';
import 'package:file_converter/data_layer/open_files.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    permissionInitializer();
    on<Init>((event, emit) async {
      emit(state.copyWith(loading: History.loading));
      if (state.permitted == true) {
        final files = await listStuff();

        emit(state.copyWith(
            convertedFiles: files,
            loading: files.isEmpty ? History.empty : History.success));
      } else {
        emit(state.copyWith(loading: History.unpermitted));
      }
    });
    on<OnRequestPermissions>((event, emit) async {
      await requestPermission();
      permissionInitializer();
      add(Init());
    });
    on<OnFileClicked>((event, emit) async {
      openFile(event.file);
    });
  }

  void permissionInitializer() async {
    if (await checkPermission()) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(permitted: true));
    } else {
      await requestPermission();
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(permitted: await checkPermission()));
    }
  }

  Future requestPermission() async => await Permission.storage.request();

  Future<bool> checkPermission() async {
    var status = await Permission.storage.status;
    return status.isGranted;
  }

  Future<List<FileSystemEntity>> listStuff() async {
    return listFiles();
  }
}
