// lib/screen/bp/summary_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novel/component/range_segment_bar.dart';
import 'package:novel/component/ui_decorations.dart';
import 'package:novel/primary-color.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _HypertensionStatusCard(),
          SizedBox(width: 15),
          _HeartRateCard(),
        ],
      ),
    );
  }
}

class _HypertensionStatusCard extends StatelessWidget {
  const _HypertensionStatusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 125.h,
      decoration: grayBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110.w,
              height: 20.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: RangeSegmentBar(
                colors: const [
                  Color(0xFF56C271), // Green
                  Color(0xFFF2D64B), // Yellow
                  Color(0xFFE5621C), // Deep Orange
                  Color(0xFF9E2C6A), // Magenta
                ],
                height: 14,
                indicator: 0.65,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "고혈압 1기",
                style: TextStyle(
                  color: PrimaryColor.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeartRateCard extends StatelessWidget {
  const _HeartRateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 125.h,
      decoration: grayBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Stack(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: heartBoxDecoration(color: PrimaryColor.pink),
              child: Image.asset("assets/icon/heart-red.png"),
            ),
            Positioned(
              right: 0,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  _BpmText(value: 70),
                  SizedBox(height: 4),
                  Text(
                    "맥박",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff626262),
                      height: 24 / 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BpmText extends StatelessWidget {
  const _BpmText({required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$value ',
            style: const TextStyle(
              color: Color(0xFF0D1B34),
              fontSize: 20,
              fontFamily: 'Pretendard',
              letterSpacing: -0.50,
              fontWeight: FontWeight.w700,
            ),
          ),
          const TextSpan(
            text: 'bpm',
            style: TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              fontFamily: 'Pretendard',
              letterSpacing: -0.35,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}
