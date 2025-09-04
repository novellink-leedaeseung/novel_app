import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

class BpInputTop extends StatelessWidget {
  const BpInputTop({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return Container(
      width: 375.w,
      height: 56.h,
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(horizontal: 24),
      // padding: const EdgeInsets.only(top: 15, left: 24, right: 24, bottom: 15),
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24
            ),
            width: 327,
            height: 24,
            child: Row(
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
                Container(
                  margin: EdgeInsets.only(left: 106, right: 94),
                  child: const Text(
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
                ),

                // 오른쪽 저장 버튼
                SizedBox(
                  width: 35,
                  height: 24,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // 여백 제거
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // 터치 영역 줄이기
                    ),
                    onPressed: () async {
                      // 저장 동작 넣기
                      final response = await dio.post(
                        'https://novel.rosq.co.kr:8488/api/auth-kiosk',
                        data: {"kioskid": "MTA001"},
                      );
                      print(response.data);
                    },
                    child: Text(
                      '저장',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF227EFF),
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                        letterSpacing: -0.50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
