import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:upscalergui/execute.dart';

import 'constants.dart';

class commonbtn extends StatefulWidget {
  const commonbtn({super.key});

  @override
  State<commonbtn> createState() => _commonbtnState();
}

class _commonbtnState extends State<commonbtn> {
  bool _isProcessing = false;
  String dropdownValue = "realesr-animevideov3";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 18,
        ),
        Text(
          "Model name",
          style: txtstyle,
        ),
        Container(
          width: 230,
          alignment: Alignment.topLeft,
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            isExpanded: true,
            dropdownColor: bgcolor,
            icon: const Icon(Icons.arrow_circle_down_rounded),
            elevation: 1,
            items: [
              'realesr-animevideov3',
              'realesrgan-x4plus',
              'realesrgan-x4plus-anime',
              'realesrnet-x4plus'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: btncolor,
                      fontSize: 18),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
                print(dropdownValue);
                mdname = dropdownValue;
              });
            },
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          "Upscale ratio",
          style: txtstyle,
        ),
        SizedBox(
          height: 18,
        ),
        ToggleSwitch(
          minWidth: 45.0,
          cornerRadius: 10.0,
          activeFgColor: Colors.black,
          activeBgColor: [btncolor, btncolor],
          inactiveFgColor: btncolor,
          initialLabelIndex: 3,
          totalSwitches: 4,
          labels: ['1x', '2x', '3x', '4x'],
          onToggle: (index) {
            upvalue = index!;
            upratio = upvalue + 1;
          },
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          "Image format",
          style: txtstyle,
        ),
        SizedBox(
          height: 18,
        ),
        ToggleSwitch(
          minWidth: 60.0,
          cornerRadius: 10.0,
          activeFgColor: Colors.black,
          activeBgColor: [btncolor, btncolor],
          inactiveFgColor: btncolor,
          initialLabelIndex: 1,
          totalSwitches: 3,
          labels: ['Jpg', 'Png', 'Webp'],
          onToggle: (index) {
            print('switched to: $index');
            imgtypeno = index!;
            print("clciked up state");
          },
        ),
        SizedBox(
          height: 25,
        ),
        _isProcessing
            ? CircularProgressIndicator()
            : MaterialButton(
                onPressed: () async {
                  setState(() {
                    _isProcessing = true;
                  });
                  await upscale();
                  setState(() {
                    _isProcessing = false;
                  });
                  if (errcheck == 1) {
                    showerrdialog(context);
                    setState(() {
                      errcheck = 0;
                    });
                  } else {
                    await showscsdialog(context);
                  }
                },
                color: btncolor,
                height: 50,
                minWidth: 200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Upscale",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
      ],
    );
  }
}
