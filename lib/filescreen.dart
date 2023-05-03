import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:upscalergui/constants.dart';
import 'package:upscalergui/execute.dart';

class filescreen extends StatefulWidget {
  const filescreen({super.key});

  @override
  State<filescreen> createState() => _filescreenState();
}

class _filescreenState extends State<filescreen> {
  String dropdownValue = "realesr-animevideov3";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              "Input image",
              style: txtstyle,
            ),
            SizedBox(
              height: 18,
            ),
            MaterialButton(
              onPressed: () {
                print("open file clicked");
                openinputfile();
              },
              color: btncolor,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Open file",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Output folder",
              style: txtstyle,
            ),
            SizedBox(
              height: 18,
            ),
            MaterialButton(
              onPressed: () async {
                print("open file clicked");
                await openoutputfolder();
                await showdialog(context);
                outname = inputtxtController.value.text;
                print(outname);
              },
              color: btncolor,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Open folder",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
    );
  }
}
