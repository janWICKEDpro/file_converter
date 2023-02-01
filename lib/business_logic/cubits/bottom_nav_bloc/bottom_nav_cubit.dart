import 'package:file_converter/business_logic/cubits/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNav> {
  BottomNavCubit() : super(BottomNav(currentIndex: 0));

  void changeIndex(int index) {
    emit(BottomNav(currentIndex: index));
  }
}
