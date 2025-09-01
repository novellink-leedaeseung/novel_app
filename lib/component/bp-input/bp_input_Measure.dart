import 'package:flutter/material.dart';

class BpInputMeasure extends StatelessWidget {
  final String label;
  final String hint;
  final String unit;
  EdgeInsetsGeometry margin = const EdgeInsets.only(top: 30, left: 24, right: 24);

  // 재사용 입력 위젯
  BpInputMeasure({
    super.key,
    required this.label,
    required this.hint,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: this.margin,
          width: 327,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF505050),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.22,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 0.50,
              color: const Color(0xFF505050),
            ),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontFamily: 'Pretendard',
              ),
              suffix: Text(
                unit,
                style: const TextStyle(
                  color: Color(0xFF505050),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF111111),
              fontSize: 16,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      ],
    );
  }

}
