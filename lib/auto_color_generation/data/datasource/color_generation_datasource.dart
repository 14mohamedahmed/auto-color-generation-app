import 'dart:math';

import 'package:auto_generate_bg_color_app/auto_color_generation/data/models/color_model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

abstract class BaseColorGenerationDataSource {
  ColorModel generateColor();
}

class ColorGenerationDataSource extends BaseColorGenerationDataSource {
  @override
  ColorModel generateColor() {  
    Random random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    Color color = Color.fromRGBO(r, g, b, 1);
    return ColorModel(randomColor: color);
  }
}
