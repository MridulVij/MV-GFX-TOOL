import 'package:flutter/material.dart';

class ConfigUI extends StatefulWidget {
  const ConfigUI({super.key});

  @override
  State<ConfigUI> createState() => _ConfigUIState();
}

class _ConfigUIState extends State<ConfigUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Configs List Appear here...')),
    );
  }
}
