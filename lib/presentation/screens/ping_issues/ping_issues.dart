import 'package:flutter/material.dart';

class PingIssues extends StatefulWidget {
  const PingIssues({super.key});

  @override
  State<PingIssues> createState() => _PingIssuesState();
}

class _PingIssuesState extends State<PingIssues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Ping Issues Appear here...')),
    );
  }
}
