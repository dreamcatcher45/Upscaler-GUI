import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:process_run/process_run.dart';
import 'package:upscalergui/constants.dart';

//class instance

openinputfile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  type:
  FileType.custom;
  allowedExtensions:
  ['jpg', 'png', 'webp'];
  if (result != null) {
    filepath = result.files.single.path!;
  } else {
    print("error in picking file");
  }
}

openinputfolder() async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

  if (selectedDirectory == null) {
    print("user closed folder");
  } else {
    indir = selectedDirectory;
  }
}

openoutputfolder() async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

  if (selectedDirectory == null) {
    print("user closed folder");
  } else {
    outdir = selectedDirectory;
  }
}

detailtest() {
  if (imgtypeno == 0) {
    imgtype = "jpg";
  }
  if (imgtypeno == 1) {
    imgtype = "png";
  }
  if (imgtypeno == 2) {
    imgtype = "webp";
  }
}

showdialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bgcolor,
          title: Text(
            'Enter the name',
            style: alttxt,
          ),
          content: TextField(
            style: TextStyle(color: btncolor, fontSize: 18),
            onChanged: (value) {},
            controller: inputtxtController,
          ),
          actions: <Widget>[
            MaterialButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            MaterialButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      });
}

showerrdialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bgcolor,
          title: Text(
            'Error Occured',
            style: alttxt,
          ),
          content: Text(
            'Please check and run again',
            style: smltxt,
          ),
          actions: <Widget>[
            MaterialButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      });
}

showscsdialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bgcolor,
          title: Text(
            'Execution Complete',
            style: alttxt,
          ),
          content: Text(
            'The output images are saved in specified directory',
            style: smltxt,
          ),
          actions: <Widget>[
            MaterialButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      });
}

cmdsetup() {
  if (outdir != null && outname != null) {
    String appname = '.\\realesrgan-ncnn-vulkan.exe -i ';
    String pd1 = appname + filepath;

    String pd2 = pd1 + ' -o ';

    String out = outdir! + '\\';
    String outt = out + outname!;
    String outtt = outt + '.' + imgtype;

    String pd3 = pd2 + outtt;
    String pd4 = pd3 + ' -s ' + "$upratio" + ' -n ' + mdname;
    cmd = pd4 + ' -f ' + imgtype;
    print(cmd);
  } else {
    checks = 'error';
    print(checks);
    errcheck = 1;
  }
}

cmdfoldersetup() {
  if (outdir != null && outname != null) {
    String appname = '.\\realesrgan-ncnn-vulkan.exe -i ';
    String pdff1 = appname + indir!;
    //input set
    String pdff2 = pdff1 + ' -o ';
    String outff = outdir!;

    String pdff3 = pdff2 + outff;
    String pdff4 = pdff3 + ' -s ' + "$upratio" + ' -n ' + mdname;
    cmd = pdff4 + ' -f ' + imgtype;
    print(cmd);
  } else {
    checks = 'error';
    print(checks);
    errcheck = 1;
  }
}

executecmd() async {
  if (cmd != null && outdir != '') {
    print("execute");
    var shell = Shell();
    await shell.run(cmd!);
    print("run complete");
  } else {
    print("stage 2 error");
    errcheck = 1;
  }
}

cleardef() {
  outname = '';
  print("cleared and redo now");
}

upscale() async {
  if (ffvalue == 0) {
    print("file run");
    await detailtest(); //optional and testing only
    await cmdsetup(); //1st
    await executecmd();
    await cleardef();
  }
  if (ffvalue == 1) {
    print("folder run");
    await detailtest();
    await cmdfoldersetup(); //edit
    await executecmd();
    await cleardef();
  }
}
