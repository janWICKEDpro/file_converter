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
          return Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: primaryColor,
                  ),
                  Text("${BlocProvider.of<FileCubit>(context).state.name}"),
                  const Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0, right: 150),
                    child: DropdownButtonFormField<FileExtensions>(
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
              )
            ],
          );
        });
  }
}
