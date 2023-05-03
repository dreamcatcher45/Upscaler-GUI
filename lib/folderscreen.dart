import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:upscalergui/constants.dart';
import 'package:upscalergui/execute.dart';

class folderscreen extends StatefulWidget {
  const folderscreen({super.key});

  @override
  State<folderscreen> createState() => _folderscreenState();
}

class _folderscreenState extends State<folderscreen> {
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
              "Input folder",
              style: txtstyle,
            ),
            SizedBox(
              height: 18,
            ),
            MaterialButton(
              onPressed: () {
                print("open folder");
                openinputfolder();
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
              onPressed: () {
                print("open output folder");
                openoutputfolder();
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
