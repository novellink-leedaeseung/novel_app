import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DatePickerPopupExample.dart';
import 'example_calendar_date_picker.dart';


class BpInputTime extends StatelessWidget {
  const BpInputTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              width: 157.w,
              height: 22.h,
              child: Text(
                " 측정 일자",
                style: const TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff505050),
                  height: 22 / 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 157.w,
              height: 22.h,
              child: Text(
                "측정 시간",
                style: const TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff505050),
                  height: 22/18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24, right: 11, top: 8),
              width: 158,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF505050), // 필요 없으면 지워도 됨
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16), // 필요시
              ),
              child: ExampleCalendarButton(), // 달력
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 158,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF505050), // 필요 없으면 지워도 됨
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16), // 필요시
              ),
              child: Text("아이콘"),
            ),
          ],
        )
      ],
    );
  }
}
