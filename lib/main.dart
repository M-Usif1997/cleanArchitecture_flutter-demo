import 'package:flutter/material.dart';

import 'core/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Posts App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}