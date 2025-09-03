// lib/screen/bp/guidance_panel.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidancePanel extends StatelessWidget {
  const GuidancePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        width: 327.w,
        height: 166.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFE2E2E2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: const [
              _GuideTitleRow(),
              SizedBox(height: 4),
              _GuideLine(
                leading: "혈압은 ",
                highlight: "고혈압1기",
                trailing: " 입니다.",
              ),
              SizedBox(height: 8),
              _GuideLine(
                leading: "수축기 혈압은 적정범위까지 ",
                highlight: "-61",
                trailing: " 남았습니다.",
              ),
              SizedBox(height: 8),
              _GuideLine(
                leading: "이완기 혈압은 적정범위까지 ",
                highlight: "-9",
                trailing: " 남았습니다.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideTitleRow extends StatelessWidget {
  const _GuideTitleRow();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Text.rich(
          TextSpan(
            children: [
              _t('정상 혈압 범위는 ', bold: true),
              _t('120/80', color: Color(0xFF227EFF), bold: true),
              _t(' ', bold: true),
              _t('mmHg'),
              _t(' 미만입니다.', bold: true),
            ],
          ),
        ),
      ),
    );
  }

  static TextSpan _t(String text, {Color color = const Color(0xFF0D1B34), bool bold = false}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        height: 1.5,
        letterSpacing: -0.4,
      ),
    );
  }
}

class _GuideLine extends StatelessWidget {
  const _GuideLine({
    required this.leading,
    required this.highlight,
    required this.trailing,
  });

  final String leading;
  final String highlight;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275.w,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: leading,
              style: const TextStyle(
                color: Color(0xFF616161),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 1.5,
                letterSpacing: -0.4,
              ),
            ),
            const TextSpan(
              text: '',
            ),
            TextSpan(
              text: highlight,
              style: const TextStyle(
                color: Color(0xFF227EFF),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 1.5,
                letterSpacing: -0.4,
              ),
            ),
            TextSpan(
              text: trailing,
              style: const TextStyle(
                color: Color(0xFF616161),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 1.5,
                letterSpacing: -0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
