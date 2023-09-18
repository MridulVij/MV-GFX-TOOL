// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/colors/colors.dart';
import 'domain/routes/route.dart';
import 'domain/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/auth/google_sign_in_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => GoogleSignInProvider()),
        )
      ],
      child: MaterialApp(
        title: "MV TOOL",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
              primary: Colors.green, secondary: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: CustomColors.otherColor,
            elevation: 0.0,
            titleSpacing: 0.0,
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            iconTheme: IconThemeData(color: CustomColors.primaryColor),
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:saf/saf.dart';
// import 'package:path/path.dart' as path;
// import 'package:file_picker/file_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SAF Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Saf _saf;
//   late Saf _saf2;

//   @override
//   void initState() {
//     // createDummyCacheFile();
//     super.initState();
//     _saf2 = Saf("Android/data/com.example.mvismad_gfx_tool/cache/file_picker");
//     _saf =
//         Saf("Android/data/com.pubg.imobile"); // Replace with your package name
//   }
// // import 'dart:io';

//   // void createDummyCacheFile() async {
//   //   Directory appDir =
//   //       await getApplicationDocumentsDirectory(); // Get app's documents directory
//   //   File dummyFile =
//   //       File('${appDir.path}/dummy_cache.txt'); // Define the file path

//   //   String sampleData = 'This is a dummy cache file.'; // Sample data
//   //   await dummyFile.writeAsString(sampleData); // Write data to the file
//   //   print(appDir);
//   //   print(sampleData);
//   // }

//   Future<void> _pickAndSaveFile() async {
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       await Permission.storage.request();
//       // await Permission.manageExternalStorage.request();
//     }
//     // createDummyCacheFile();
//     await _saf.getDirectoryPermission(
//         isDynamic: true, grantWritePermission: true);
//     await _saf.getDirectoryPermission(
//         isDynamic: true, grantWritePermission: true);

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null && result.files.isNotEmpty) {
//       File file = File(result.files.single.path!);
//       print('Result: $result');
//       Directory storageDir =
//           Directory("storage/emulated/0/Android/data/com.pubg.imobile");
//       String desiredFolderPath = path.join(storageDir.path, '');
//       if (!await Directory(desiredFolderPath).exists()) {
//         await Directory(desiredFolderPath).create(recursive: true);
//       }

//       String desiredFilePath =
//           path.join(desiredFolderPath, path.basename(file.path));

//       try {
//         await file.copy(desiredFilePath);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('File saved successfully!')));
//       } catch (e) {
//         print(e);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Error: $e')));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAF Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _pickAndSaveFile,
//           child: Text('Pick and Save File'),
//         ),
//       ),
//     );
//   }
// }





// /*
//    <uses-permission android:name="android.permission.INTERNET"/>
//     <uses-permission android:name="android.permission.VIBRATE"/>
//     <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.ACCESS_ALL_DOWNLOADS"/>
//     <uses-permission android:name="android.permission.ACCESS_CONTENT_PROVIDERS_EXTERNALLY"/>
//     <uses-permission android:name="android.permission.INTERNET"/>
//     <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
//     <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW"/>
//     <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
//     <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
//     <uses-permission android:name="android.permission.ACCESS_NETWORK_CONDITIONS"/>
//     <uses-permission android:name="android.permission.WAKE_LOCK"/>


//      minSdkVersion: '21'
//   targetSdkVersion: '33'
// */




































































































//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:saf/saf.dart';

// void main() async {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Picker Example',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String gamefolderpath = "Android/data/com.pubg.imobile/files";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Picker Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             String result = await pickFileAndSave(gamefolderpath, "ini");
//             print("Result: $result");
//           },
//           child: Text('Pick and Save File'),
//         ),
//       ),
//     );
//   }
// }

// Future<String> pickFileAndSave(String paths, String extensionMustBe) async {
//   var status = await Permission.storage.status;
//   if (!status.isGranted) {
//     await Permission.storage.request();
//   }

//   Saf saf = Saf("Android/data/com.example.mvismad_gfx_tool");
//   await saf.getDirectoryPermission(isDynamic: true, grantWritePermission: true);

//   Saf safPubg = Saf("Android/data/com.pubg.imobile");
//   await safPubg.getDirectoryPermission(
//       isDynamic: true, grantWritePermission: true);

//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if (result != null && result.files.isNotEmpty) {
//     if (result == false && result.files.isEmpty) return "0";
//     File file = File(result.files.single.path!);

//     Directory? storageDir = Directory(paths);
//     String desiredFolderPath = path.join(storageDir.path, '');
//     if (!await Directory(desiredFolderPath).exists()) {
//       await Directory(desiredFolderPath).create(recursive: true);
//     }

//     String desiredFilePath =
//         path.join(desiredFolderPath, path.basename(file.path));
//     String receivedFileExtension;

//     int dotIndex = file.path.lastIndexOf('.');
//     if (dotIndex != -1 && dotIndex < file.path.length - 1) {
//       receivedFileExtension = file.path.substring(dotIndex + 1);
//     } else {
//       receivedFileExtension = "Not Found Desired Extension!";
//     }

//     if (receivedFileExtension == extensionMustBe) {
//       if (await File(desiredFilePath).exists()) {
//         await File(desiredFilePath).delete();
//       }
//       try {
//         await file.copy(desiredFilePath);
//         return "File Pasted!";
//       } catch (e) {
//         print(e);
//         return "Error: $e";
//       }
//     } else {
//       return "Invalid Extension";
//     }
//   }

//   return "No File Selected";
// }

//















































































/////
///
///
/*
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:saf/saf.dart';

/// Edit the Directory Programmatically Here
///
const bgmiDir = "Android/data/com.pubg.imobile";
const gfxToolDir = "Android/data/com.example.mvismad_gfx_tool";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Saf saf;
  var _paths = [];
  @override
  void initState() {
    super.initState();
    Permission.storage.request();
    saf = Saf(gfxToolDir);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Saf example app'),
        ),
        body: Center(child: Text("Path: $saf")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await saf.getDirectoryPermission(
                isDynamic: true, grantWritePermission: true);
          },
        ),
      ),
    );
  }
}
*/

///
///

// // This code is for file picker
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';

// class FilePickerExample extends StatelessWidget {
//   FilePickerExample({super.key});

//   Future<String> pickFileAndSave(String paths, String extensionMustBe) async {
// // correct way to get runtime permission
//     var status = await Permission.manageExternalStorage.status;
//     if (!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }
//     //

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null && result.files.isNotEmpty) {
//       if (result == false && result.files.isEmpty) return "0";
//       File file = File(result.files.single.path!);

//       // Get the external storage directory path
//       Directory? storageDir = Directory(paths);
//       //await getExternalStorageDirectory();
//       print('Test Path: ${storageDir}');
//       String desiredFolderPath = path.join(storageDir.path, '');
//       // If the folder doesn't exist, create it
//       print(desiredFolderPath);
//       if (!await Directory(desiredFolderPath).exists()) {
//         await Directory(desiredFolderPath).create(recursive: true);
//       }

//       // Combine the desired folder path with the file's name
//       String desiredFilePath =
//           path.join(desiredFolderPath, path.basename(file.path));
//       print("1. $desiredFilePath");
//       print("2. ${file.path}");
//       String receivedFileExtension;

//       int dotIndex = file.path.lastIndexOf('.');
//       if (dotIndex != -1 && dotIndex < file.path.length - 1) {
//         receivedFileExtension = file.path.substring(dotIndex + 1);
//         print("Received Extension: $receivedFileExtension");
//       } else {
//         receivedFileExtension = "Not Found Desired Extension!";
//       }
//       // in future if we want to check more extension related files that we have to paste then we just add "extension_name" in receivedFileExtension == "extension_name" to check the file
//       if (receivedFileExtension == extensionMustBe) {
//         if (await File(desiredFilePath).exists()) {
//           await File(desiredFilePath).delete();
//         }

//         try {
//           file.copy(desiredFilePath);
//           print(desiredFilePath);
//           // Copy the selected file to the desired folder path
//           print("File Pasted!");
//         } catch (e) {
//           print(e);
//         }
//       } else {
//         return "0";
//       }
//       return "1";
//     }

//     return "2"; // when user have not select any file and exit from file manager without selecting
//   }

//   @override
//   Widget build(BuildContext context) {
//     String gamefolderpath =
//         "storage/emulated/0/Android/data/com.pubg.imobile/files";
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Picker Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             pickFileAndSave(
//                 gamefolderpath, "ini"); // Change the extension as needed
//             // print("Result: $result");
//           },
//           child: Text('Pick and Save File'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: FilePickerExample(),
//   ));
// }

// ////
// ///
// ///
// ///
// ///
// ///
// ///
// //
// Now the problem is jab ham file select krne k baad file ko paste krne ka folder select krre h toh data folder show nhi hora usko paste krne k liye

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';

// class FilePickerExample extends StatefulWidget {
//   @override
//   _FilePickerExampleState createState() => _FilePickerExampleState();
// }

// class _FilePickerExampleState extends State<FilePickerExample> {
//   Future<String> pickFileAndSave(String extensionMustBe) async {
//     // Request storage permission
//     var status = await Permission.manageExternalStorage.status;
//     if (!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null && result.files.isNotEmpty) {
//       File file = File(result.files.single.path!);

//       // Use Storage Access Framework to let the user choose a directory
//       String? pickedDirPath = await FilePicker.platform
//           .getDirectoryPath(initialDirectory: "storage/emulated/0/SaveGames");
// // M2004J19C
//       if (pickedDirPath != null) {
//         String desiredFolderPath = path.join(pickedDirPath, '');
//         Directory desiredDirectory = Directory(desiredFolderPath);
//         if (!await desiredDirectory.exists()) {
//           await desiredDirectory.create(recursive: true);
//         }

//         String desiredFilePath =
//             path.join(desiredFolderPath, path.basename(file.path));

//         String receivedFileExtension = path.extension(file.path).toLowerCase();
//         print('File Picker $result');
//         print('Picked Dir Path $pickedDirPath');
//         print('Desired File Path $desiredFilePath');
//         print('Desired Folder Path $desiredFolderPath');
//         print('Desired Directory $desiredDirectory');
//         if (receivedFileExtension == ".$extensionMustBe") {
//           if (await File(desiredFilePath).exists()) {
//             await File(desiredFilePath).delete();
//           }

//           try {
//             await file.copy(desiredFilePath);
//             return "1"; // File successfully saved
//           } catch (e) {
//             print(e);
//             return "0"; // Error copying the file
//           }
//         } else {
//           return "0"; // Invalid file extension
//         }
//       } else {
//         return "2"; // User didn't select a directory
//       }
//     }

//     return "2"; // User didn't select any file or exited from file manager
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Picker Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             String result =
//                 await pickFileAndSave("ini"); // Change the extension as needed
//             print("Result: $result");
//           },
//           child: Text('Pick and Save File'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: FilePickerExample(),
//   ));
// }

///
///
///
///
///
///
///
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scoped Storage Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<String> pickFileAndSave(String paths, String extensionMustBe) async {
//     var status = await Permission.manageExternalStorage.status;
//     if (!status.isGranted) {
//       await Permission.manageExternalStorage.request();
//     }

//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null && result.files.isNotEmpty) {
//       PlatformFile file = result.files.single;

//       Directory appDocumentsDirectory;
//       if (Platform.isAndroid) {
//         appDocumentsDirectory = Directory(await FilePicker.platform
//                 .getDirectoryPath(
//                     lockParentWindow: true,
//                     dialogTitle: "Access This Folder",
//                     initialDirectory: "storage/emulated/0/Android/data") ??
//             "");
//       } else {
//         appDocumentsDirectory = await getApplicationDocumentsDirectory();
//       }

//       final String desiredFilePath =
//           '${appDocumentsDirectory.path}/${file.name}';

//       String receivedFileExtension;

//       int dotIndex = file.name.lastIndexOf('.');
//       if (dotIndex != -1 && dotIndex < file.name.length - 1) {
//         receivedFileExtension = file.name.substring(dotIndex + 1);
//       } else {
//         receivedFileExtension = "Not Found Desired Extension!";
//       }

//       if (receivedFileExtension == extensionMustBe) {
//         if (await File(desiredFilePath).exists()) {
//           await File(desiredFilePath).delete();
//         }

//         try {
//           await File(file.path!).copy(desiredFilePath);
//           // Open the saved file's folder using the open_file package

//           return "File saved and folder opened!";
//         } catch (e) {
//           print(e);
//           return "Error while copying";
//         }
//       } else {
//         return "Extension doesn't match";
//       }
//     }

//     return "User canceled or no file selected";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scoped Storage Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             String result =
//                 await pickFileAndSave('/desired/folder/path', 'ini');
//             print('Operation result: $result');
//           },
//           child: Text('Pick and Save PDF File'),
//         ),
//       ),
//     );
//   }
// }

/// Android SAF
