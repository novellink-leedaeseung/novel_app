import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
      child: Container(
        width: 327.w,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xff227eff), // 파란색
              blurRadius: 4,            // 흐림 정도 (사방으로 4px 퍼짐)
              spreadRadius: 0.4,          // 그림자 영역 확장 (바깥쪽으로 4px)
            ),

          ],
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 3.0,
            padding: EdgeInsets.zero,
            side: BorderSide(color: Color(0xff227eff)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          onPressed: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 14,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 26,
                  child: Text(
                    "공지사항",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 26/14,
                      letterSpacing: -0.5,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 11,
                  bottom: 17,
                ),
                child: SizedBox(
                  width: 303.w,
                  height: 22.h,
                  child: Text(
                    "근로자의 날 오픈기념으로 이벤트 진행합니다!",
                    style: TextStyle(
                      color: Color(0xff227eff),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 12/22,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
