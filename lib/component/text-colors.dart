import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../primary-color.dart';

class TextWidgetColors {
  // 홈 화면에 혈압 박스에 [수축기 혈압, 이완기 혈압, 맥박] 등 같은 옵션 타입일 경우

  static TextStyle homeBloodBoxTextStyle() {
    return TextStyle(
        color: PrimaryColor.gray,
        fontFamily: "Pretendard",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 6/12
    );
  }

  static TextStyle homeBloodBox() {
    return TextStyle(
        color: PrimaryColor.gray,
        fontFamily: "Pretendard",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 6/12
    );
  }

  static Text grayTextWidget({
    text = '', color = Colors.white
  })
  {
    return Text('${text}', style: TextStyle(color: color));
  }
}
