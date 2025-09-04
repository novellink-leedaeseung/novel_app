import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BpInputMeasure extends StatelessWidget {
  final String label;
  final String hint;
  final String unit;
  final ValueChanged<String>? onChanged;  // 추가: 값이 변경될 때 호출될 콜백

  const BpInputMeasure({
    super.key,
    required this.label,
    required this.hint,
    required this.unit,
    this.onChanged,  // 추가
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 24, top: 12, bottom: 8),
          width: 327,
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFF505050),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.22,
              letterSpacing: -0.45,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          width: 327.w,
          height: 60.h,
          decoration: ShapeDecoration(
            color: const Color(0x050066FF),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFF505050),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          child: TextField(
            onChanged: onChanged,  // 추가: TextField의 값이 변경될 때 콜백 호출
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,         // 기본 언더라인 제거
              focusedBorder: InputBorder.none,  // 포커스 시 언더라인 제거
              enabledBorder: InputBorder.none,  // 활성화 상태에서도 제거
              hintText: hint,
              suffixText: unit,
              isDense: false,
            ),
          ),
        ),
      ],
    );
  }
}