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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BaseColorGenerationDataSource baseColorGenerationDataSource =
            ColorGenerationDataSource();
        BaseColorGenerationRepository baseColorGenerationRepository =
            ColorGenerationRepository(baseColorGenerationDataSource);
        final useCase =
            GenerateRandomColorUseCase(baseColorGenerationRepository);
        // we can use any state management insted of using statfult widget to avoid rebuild of entire  screen
        setState(() {
          appBgColor = useCase().randomColor;
        });
      },
      child: Scaffold(
        backgroundColor: appBgColor,
        body: const Center(
          child: Text(AppStrings.generationColorScreenMessage),
        ),
      ),
    );
  }
}
