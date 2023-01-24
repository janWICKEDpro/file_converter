import 'package:file_converter/bloc/bottom_nav_bloc/bottom_nav_cubit.dart';
import 'package:file_converter/bloc/file_selection_bloc/file_bloc.dart';
import 'package:file_converter/props.dart';
import 'package:file_converter/screens/history.dart';
import 'package:file_converter/screens/select_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_nav_bloc/bottom_nav_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [SelectFile(), History()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNav>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Super Converter Pro Max",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: screens[state.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            showUnselectedLabels: false,
            enableFeedback: true,
            currentIndex: state.currentIndex,
            onTap: (index) {
              BlocProvider.of<BottomNavCubit>(context).changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_max),
                label: "Convert",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_copy),
                label: "Conversions",
              ),
            ]),
      );
    });
  }
}
