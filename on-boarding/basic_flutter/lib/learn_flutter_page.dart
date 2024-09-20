import 'dart:ffi';

import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitched = false;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text("Learn Flutter"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => debugPrint("Icon button pressed"),
            icon: const Icon(Icons.info),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/einstain.jpeg"),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.blueGrey,
              child: const Text(
                "This is the text widget",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("Elevated Button Clicked");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitched ? Colors.red : Colors.amber),
              child: const Text("Elevated Button"),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Outlined Button Clicked");
              },
              child: const Text("Outlined Button"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                debugPrint("Text Button Clicked");
              },
              child: const Text("Text Button"),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => debugPrint("Row Clicked"),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text("Row Widget"),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Switch(
              value: isSwitched,
              onChanged: (bool status) {
                setState(() {
                  isSwitched = status;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Checkbox(
              value: isChecked,
              onChanged: (bool? checkStatus) {
                setState(() {
                  isChecked = checkStatus;
                });
              },
            ),
            Image.network(
                "https://th.bing.com/th/id/OIP.ycw03DgGmEI_HXf4zi27lQHaFj?rs=1&pid=ImgDetMain")
          ],
        ),
      ),
    );
  }
}
