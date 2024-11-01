import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mv_tool/domain/plugins/android_10_file_mover.dart';
import 'package:permission_handler/permission_handler.dart';

import 'domain/paths/game_paths_directory.dart';

class permission extends StatefulWidget {
  const permission({Key? key}) : super(key: key);

  @override
  _Permission createState() => _Permission();
}

Future<bool> _requestPermission(Permission permission) async {
  AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  if (build.version.sdkInt >= 29) {
    var re = await Permission.manageExternalStorage.request();
    if (re.isGranted) {
      return true;
    } else {
      return false;
    }
  } else {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      bool isCache = await permission.status.isGranted;
      print(isCache);
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}

class _Permission extends State<permission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Storage Permission in Android(11,12 and 13)',
            style: TextStyle(fontSize: 16),
          )),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              if (await _requestPermission(Permission.storage) == true) {
                print("Permission is granted");
              } else {
                print("permission is not granted");
              }
            },
            child: Text('click'),
          ),
          ElevatedButton(
              onPressed: () {
                FileMover().pickFileAndSave(
                    paths: GamePathsDirectory.internalStoragePath +
                        GamePathsDirectory.bgmi,
                    extensionMustBe: 'ini');
              },
              child: Text('Mover'))
        ],
      )),
    );
  }
}
