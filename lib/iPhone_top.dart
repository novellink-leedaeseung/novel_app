import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IphoneTop extends StatelessWidget {
  const IphoneTop({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    // 다이나믹 아일랜드 및 노치
    return SizedBox(width: 375.w, height: 44.h);
  }
}
