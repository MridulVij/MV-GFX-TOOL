import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class FileMover {
  static bool isfileMoved = false;

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

//  Android 10 Code - Working Code!
  Future<String> pickFileAndSave(
      {required String paths, required String extensionMustBe}) async {
    // correct way to get runtime permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    // await saf.getDirectoryPermission(
    //     isDynamic: true, grantWritePermission: true);

    //
    if (await _requestPermission(Permission.storage) == true) {
      print("Permission is granted");
    } else {
      print("permission is not granted");
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      if (result == false && result.files.isEmpty) return "0";
      File file = File(result.files.single.path!);

      // Get the external storage directory path
      Directory? storageDir = Directory(paths);
      //await getExternalStorageDirectory();
      print('Test Path: ${storageDir}');
      String desiredFolderPath = path.join(storageDir.path, '');
      // If the folder doesn't exist, create it
      if (!await Directory(desiredFolderPath).exists()) {
        await Directory(desiredFolderPath).create(recursive: true);
      }

      // Combine the desired folder path with the file's name
      String desiredFilePath =
          path.join(desiredFolderPath, path.basename(file.path));
      print("1. $desiredFilePath");
      print("2. ${file.path}");
      String receivedFileExtension;

      int dotIndex = file.path.lastIndexOf('.');
      if (dotIndex != -1 && dotIndex < file.path.length - 1) {
        receivedFileExtension = file.path.substring(dotIndex + 1);
        print("Received Extension: $receivedFileExtension");
      } else {
        receivedFileExtension = "Not Found Desired Extension!";
      }
      // in future if we want to check more extension related files that we have to paste then we just add "extension_name" in receivedFileExtension == "extension_name" to check the file
      if (receivedFileExtension == extensionMustBe) {
        if (await File(desiredFilePath).exists()) {
          await File(desiredFilePath).delete();
        }
        try {
          // Copy the selected file to the desired folder path
          // await saf.getDirectoryPermission(
          //     grantWritePermission: true, isDynamic: true);

          await file.copySync(desiredFilePath);

          print("File Pasted!");
          print(desiredFilePath);
        } catch (e) {
          print(e);
          return "3";
        }
      } else {
        return "0";
      }
      isfileMoved = true;
      return "1";
    }

    return "2"; // when user have not select any file and exit from file manager without selecting
  }
}
