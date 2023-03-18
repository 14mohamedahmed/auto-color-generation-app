import 'package:auto_generate_bg_color_app/auto_color_generation/domain/entities/color_interface.dart';

abstract class BaseColorGenerationRepository {
  ColorInterface generateColor();
}
