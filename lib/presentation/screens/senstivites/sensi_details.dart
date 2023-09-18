import 'package:flutter/material.dart';

class SensiDetails extends StatefulWidget {
  const SensiDetails({super.key, required this.sensiName});
  final String sensiName;

  @override
  State<SensiDetails> createState() => _SensiDetailsState();
}

class _SensiDetailsState extends State<SensiDetails> {
  // final String sensiName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sensiName)),
      body: Column(children: [
        //
      ]),
    );
  }
}
