// lib/screen/bp/bp_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BpAppBar extends StatelessWidget {
  const BpAppBar({
    super.key,
    required this.onBack,
    required this.onOpenList,
  });

  final VoidCallback onBack;
  final VoidCallback onOpenList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff227EFF),
      width: 375.w,
      height: 56.h,
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: IconButton(
              padding: const EdgeInsets.only(left: 24),
              iconSize: 24,
              onPressed: onBack,
              icon: SvgPicture.asset("assets/icon/back.svg"),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "혈압",
                style: const TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFFFFF),
                  height: 24 / 20,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: onOpenList,
            child: const Text(
              "목록",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFFFFF),
                height: 24 / 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
