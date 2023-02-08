import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'converted_files_state.dart';

class ConvertedFilesCubit extends Cubit<ConvertedFilesState> {
  ConvertedFilesCubit() : super(ConvertedFilesInitial());
}
