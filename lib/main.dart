import 'package:auto_generate_bg_color_app/core/utils/app_strings.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/presentation/auto_color_generation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AutoColorGenerationApp());
}

class AutoColorGenerationApp extends StatelessWidget {
  const AutoColorGenerationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AutoColorGenerationScreen(),
    );
  }
}
