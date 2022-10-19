import 'dart:async';

import 'package:app_set_id/app_set_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _identifier = 'Loading...';
  final _appSetIdPlugin = AppSetId();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String identifier;
    try {
      identifier = await _appSetIdPlugin.getIdentifier() ?? "Unknown";
    } on PlatformException {
      identifier = 'Failed to get identifier.';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Set ID'),
        ),
        body: Center(
          child: Text('App Set ID: $_identifier\n'),
        ),
      ),
    );
  }
}
