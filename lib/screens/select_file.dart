import 'package:file_converter/business_logic/file_picker_methods.dart';
import 'package:file_converter/props.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectFile extends StatelessWidget {
  SelectFile({super.key});
  var file = FilePickerMethods();
  @override
  Widget build(BuildContext context) {
    return Center(
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
                      top: BorderSide(color: primaryColor, width: 2.5),
                      left: BorderSide(color: primaryColor, width: 2.5),
                      right: BorderSide(color: primaryColor, width: 2.5),
                      bottom: BorderSide(color: primaryColor, width: 2.5))),
              child: IconButton(
                enableFeedback: true,
                onPressed: () {
                  showModalBottomSheet(
                      useRootNavigator: true,
                      context: context,
                      builder: (context) => Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          var filee = file.pickFile();
                                          print(filee);
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
                                        onPressed: () {},
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
    );
  }
}
