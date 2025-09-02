import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BpInputTop extends StatelessWidget {
  const BpInputTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 56.h,
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.only(top: 15, left: 24, right: 24, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 왼쪽 아이콘 자리
          SizedBox(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset("assets/icon/close.svg"),
            ),
          ),

          // 중앙 제목
          const Text(
            '혈압입력',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF227EFF),
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),

          // 오른쪽 저장 버튼
          const Text(
            '저장',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF227EFF),
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
