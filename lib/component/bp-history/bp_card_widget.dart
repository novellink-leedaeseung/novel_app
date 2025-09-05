// lib/screen/bp/bp_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BpCard extends StatelessWidget {
  const BpCard({
    super.key,
    this.stage = '고혈압1기',
    this.dateText = '2025.08.15 13:40',
    this.sys = 148,
    this.dia = 128,
    this.hr = 70,
    this.sourceText = '블루투스 측정',
    this.stageColor = const Color(0xFFE5621C),
  });

  final String stage;
  final String dateText;
  final int sys;
  final int dia;
  final int hr;
  final String sourceText;
  final Color stageColor;

  @override
  Widget build(BuildContext context) {
    const family = 'Pretendard';

    return Container(
      width: 327.w,
      height: 150.h,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 2,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 좌측
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage,
                  style: TextStyle(
                    color: stageColor,
                    fontFamily: family,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 24 / 16,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    const Icon(Icons.bluetooth, size: 16, color: Color(0xFF227EFF)),
                    const SizedBox(width: 6),
                    Text(
                      sourceText,
                      style: const TextStyle(
                        color: Color(0xFF8C8C8C),
                        fontFamily: family,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 우측
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dateText,
                style: const TextStyle(
                  color: Color(0x99000000),
                  fontFamily: family,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: family,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(text: '$sys / $dia ', style: const TextStyle(fontSize: 22)),
                    const TextSpan(
                      text: 'mmHg',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontFamily: family),
                  children: [
                    TextSpan(
                      text: '$hr ',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                      text: 'bpm',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}