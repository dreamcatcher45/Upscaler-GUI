import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:upscalergui/commonbtn.dart';
import 'package:upscalergui/filescreen.dart';
import 'package:upscalergui/folderscreen.dart';
import 'package:window_manager/window_manager.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1040, 750));
    WindowManager.instance.setMaximumSize(const Size(1040, 750));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Row(children: [
        sidebar(),
        imgscreen(),
      ]),
    );
  }
}

class sidebar extends StatefulWidget {
  const sidebar({super.key});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: Container(
          color: bgcolor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Input Type",
                  style: txtstyle,
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          ffvalue = 0;
                          filebtncolor = btnpresscolor;
                          folderbtncolor = bgcolor;
                        });
                      },
                      color: filebtncolor,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: btncolor,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "File",
                        style: TextStyle(color: btncolor),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          ffvalue = 1;
                          folderbtncolor = btnpresscolor;
                          filebtncolor = bgcolor;
                        });
                      },
                      color: folderbtncolor,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: btncolor,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Folder",
                        style: TextStyle(color: btncolor),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (ffvalue == 0) ...[
                      filescreen(),
                    ],
                    if (ffvalue == 1) ...[
                      folderscreen(),
                    ],
                  ],
                ),
                commonbtn(),
              ],
            ),
          ),
        ));
  }
}

class imgscreen extends StatefulWidget {
  const imgscreen({super.key});

  @override
  State<imgscreen> createState() => _imgscreenState();
}

class _imgscreenState extends State<imgscreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: bgcolor,
          child: Center(
            child: ImageCompareSlider(
              itemOne: Image.asset(
                inputfilepath,
                fit: BoxFit.cover,
              ),
              itemTwo: Image.asset(
                outputfilepath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
