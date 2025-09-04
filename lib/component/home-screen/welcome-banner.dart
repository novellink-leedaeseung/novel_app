import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


// 환영메시지, 기업회원 버튼
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 14, top: 14),
      child: Row(
        children: [
          SizedBox(
            width: 190.w,
            height: 42.h,
            child: Text(
              "메디터치에 오신 걸 환영합니다. 스마트하게 건강 관리하세요!",
              softWrap: true,
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.3125, // 행간
                letterSpacing: -0.4, // 자간
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 49, right: 24),
            child: SizedBox(
              width: 88.w,
              height: 24.h,
              child: Row(
                children: [
                  SvgPicture.asset("assets/icon/office.svg"),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      '기업회원 전환',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0.22,
                        letterSpacing: -0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
