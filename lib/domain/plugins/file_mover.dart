import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class FileMover {
//  Android 10 Code - Working Code!
  static Future<String> pickFileAndSave(
      String paths, String extensionMustBe) async {
    // correct way to get runtime permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    //

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
          await file.copy(desiredFilePath);
          print("File Pasted!");
          print(desiredFilePath);
        } catch (e) {
          print(e);
          return "3";
        }
      } else {
        return "0";
      }
      return "1";
    }

    return "2"; // when user have not select any file and exit from file manager without selecting
  }
}
