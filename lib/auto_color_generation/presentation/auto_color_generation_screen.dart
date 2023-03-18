import 'dart:async';

import 'package:auto_generate_bg_color_app/auto_color_generation/data/datasource/color_generation_datasource.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/data/repository/color_generation_repository.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/domain/repository/base_color_generation_repository.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/domain/usecases/generate_random_color.dart';
import 'package:auto_generate_bg_color_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AutoColorGenerationScreen extends StatefulWidget {
  const AutoColorGenerationScreen({super.key});

  @override
  State<AutoColorGenerationScreen> createState() =>
      _AutoColorGenerationScreenState();
}

class _AutoColorGenerationScreenState extends State<AutoColorGenerationScreen> {
  Color appBgColor = Colors.white;
  late Timer timer;
  late GenerateRandomColorUseCase generateRodomColorUseCase;
  @override
  void initState() {
    super.initState();
    BaseColorGenerationDataSource baseColorGenerationDataSource =
        ColorGenerationDataSource();
    BaseColorGenerationRepository baseColorGenerationRepository =
        ColorGenerationRepository(baseColorGenerationDataSource);
    generateRodomColorUseCase =
        GenerateRandomColorUseCase(baseColorGenerationRepository);
  }

  _runColorGenerationInPeriodicTimer(
      GenerateRandomColorUseCase generateRodomColorUseCase) {
    setState(() {
      appBgColor = generateRodomColorUseCase().randomColor;
    });
    timer = Timer.periodic(const Duration(seconds: 3), (timerState) {
      if (timerState.isActive) {
        setState(() {
          appBgColor = generateRodomColorUseCase().randomColor;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // we can use any state management insted of using statfult widget to avoid rebuild of entire  screen
        _runColorGenerationInPeriodicTimer(generateRodomColorUseCase);
      },
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: appBgColor,
          child: const Center(
            child: Text(AppStrings.generationColorScreenMessage),
          ),
        ),
      ),
    );
  }
}
