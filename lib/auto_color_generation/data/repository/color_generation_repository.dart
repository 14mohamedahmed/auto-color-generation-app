import 'package:auto_generate_bg_color_app/auto_color_generation/data/datasource/color_generation_datasource.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/domain/entities/color_interface.dart';
import 'package:auto_generate_bg_color_app/auto_color_generation/domain/repository/base_color_generation_repository.dart';

class ColorGenerationRepository extends BaseColorGenerationRepository {
  final BaseColorGenerationDataSource _baseColorGenerationDataSource;
  ColorGenerationRepository(this._baseColorGenerationDataSource);
  @override
  ColorInterface generateColor() {
    return _baseColorGenerationDataSource.generateColor();
  }
}
