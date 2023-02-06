import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_bloc.dart';
import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_state.dart';
import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/screens/conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SelectFile extends StatelessWidget {
  const SelectFile({super.key});
  final val = FileExtensions.none;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileCubit, FileState>(
      builder: (context, state) {
        return (state.files.isEmpty)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Select a file to convert",
                      style: TextStyle(color: primaryColor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border(
                                top:
                                    BorderSide(color: primaryColor, width: 2.5),
                                left:
                                    BorderSide(color: primaryColor, width: 2.5),
                                right:
                                    BorderSide(color: primaryColor, width: 2.5),
                                bottom: BorderSide(
                                    color: primaryColor, width: 2.5))),
                        child: IconButton(
                          enableFeedback: true,
                          onPressed: () {
                            showModalBottomSheet(
                                useRootNavigator: true,
                                context: context,
                                builder: (context) => SizedBox(
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    BlocProvider.of<FileCubit>(
                                                            context)
                                                        .pickFile();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.file_open,
                                                    color: primaryColor,
                                                  )),
                                              const Text("Single file")
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 100,
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    BlocProvider.of<FileCubit>(
                                                            context)
                                                        .pickFiles();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.file_copy,
                                                    color: primaryColor,
                                                  )),
                                              const Text("Multiple files")
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 90,
                          ),
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const ConversionScreen();
      },
    );
  }
}
