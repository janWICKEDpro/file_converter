import 'package:file_converter/constants/props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubits/file_selection_cubit/file_bloc.dart';
import '../constants/enums.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: dropDownKey,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount:
                    BlocProvider.of<FileCubit>(context).state.files.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (BlocProvider.of<FileCubit>(context).state.num ==
                                    NumberOfFiles.single)
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(icons[
                                                  BlocProvider.of<FileCubit>(
                                                          context)
                                                      .state
                                                      .extension] ??
                                              'assets/images/noimage.ico')),
                                    ),
                                  )
                                : Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          icons[BlocProvider.of<FileCubit>(
                                                      context)
                                                  .state
                                                  .extensions![index]] ??
                                              'assets/images/noimage.ico',
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              width: 200,
                              child: Center(
                                child: (BlocProvider.of<FileCubit>(context)
                                            .state
                                            .num ==
                                        NumberOfFiles.single)
                                    ? Text(
                                        "${BlocProvider.of<FileCubit>(context).state.name}",
                                        softWrap: true,
                                      )
                                    : Text(BlocProvider.of<FileCubit>(context)
                                        .state
                                        .names![index]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: DropdownButtonFormField<FileExtensions>(
                                  validator: (val) {
                                    if (val == FileExtensions.none) {
                                      return "error";
                                    } else if (BlocProvider.of<FileCubit>(
                                                        context)
                                                    .state
                                                    .num ==
                                                NumberOfFiles.single &&
                                            val ==
                                                BlocProvider.of<FileCubit>(
                                                        context)
                                                    .state
                                                    .extension ||
                                        BlocProvider.of<FileCubit>(context)
                                                    .state
                                                    .num ==
                                                NumberOfFiles.multiple &&
                                            val ==
                                                BlocProvider.of<FileCubit>(
                                                        context)
                                                    .state
                                                    .extensions![index]) {
                                      return "select valid extension";
                                    }
                                    return null;
                                  },
                                  isExpanded: true,
                                  isDense: true,
                                  value: BlocProvider.of<FileCubit>(context)
                                      .state
                                      .files[index]
                                      .conversionExtension,
                                  items: FileExtensions.values
                                      .map((e) =>
                                          DropdownMenuItem<FileExtensions>(
                                            value: e,
                                            child: Text(e.name),
                                          ))
                                      .toList(),
                                  onChanged: (extensions) {
                                    BlocProvider.of<FileCubit>(context)
                                        .setConversionExtension(
                                            extensions!, index);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    if (dropDownKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed("download");
                    }
                  },
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
          ),
        ],
      ),
    );
  }
}
