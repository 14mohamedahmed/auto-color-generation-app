import 'package:auto_generate_bg_color_app/auto_color_generation/domain/entities/color_interface.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/domain/repository/base_color_generation_repository.dart';

class GenerateRandomColorUseCase {
  final BaseColorGenerationRepository _baseColorGenerationRepository;
  GenerateRandomColorUseCase(this._baseColorGenerationRepository);

  // why call? flutter support callable function that give you avaliblity to use call method with write call keyword
  // like this => GenerateRandomColorUseCase();
  ColorInterface call() {
    return _baseColorGenerationRepository.generateColor();
  }
}
