import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../primary-color.dart';

class TextWidgetColors {
  static Text grayTextWidget({
    text = '', color = Colors.white
  })
  {
    return Text('${text}', style: TextStyle(color: color));
  }
}
