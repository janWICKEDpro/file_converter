import 'package:file_converter/props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/file_selection_bloc/file_bloc.dart';
import '../enums.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: BlocProvider.of<FileCubit>(context).state.files.length,
        itemBuilder: (context, index) {
          return Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(icons[
                                  BlocProvider.of<FileCubit>(context)
                                      .state
                                      .extension]!)),
                        ),
                      ),
                      Text("${BlocProvider.of<FileCubit>(context).state.name}"),
                      Container(
                        width: 100,
                        child: DropdownButtonFormField<FileExtensions>(
                            isExpanded: true,
                            isDense: true,
                            value: FileExtensions.none,
                            items: FileExtensions.values
                                .map((e) => DropdownMenuItem<FileExtensions>(
                                      value: e,
                                      child: Text("${e.name}"),
                                    ))
                                .toList(),
                            onChanged: (item) {}),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          "Convert",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<FileCubit>(context).clearPickedFiles();
                  },
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          );
        });
  }
}
