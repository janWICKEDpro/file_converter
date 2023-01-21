import 'package:file_converter/props.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Super Converter Pro Max",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
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
                  //enableFeedback: true,
                  onPressed: () {},
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          showUnselectedLabels: false,
          enableFeedback: true,
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
  }
}
