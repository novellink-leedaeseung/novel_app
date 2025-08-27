import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/component/text-colors.dart';
import 'package:novel/component/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/notice.dart';
import '../component/user-profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            child: Container(
              color: Color(0xFF227EFF),
              child: Column(
                children: [
                  // 다이나믹 아일랜드 및 노치
                  IphoneTop(),
                  // 프로필 사진, 사용자 이름, 사람모양, 옵션
                  UserProfile(),
                  // 환영메시지, 기업회원 버튼
                  WelcomeBanner(),
                ],
              ),
            ),
          ),
          // 스크롤바
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Notice(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 24,
                  ),
                  child: SizedBox(
                    width: 327.w,
                    height: 115.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff227eff), // 파란색 glow
                            blurRadius: 4, // 퍼짐 정도 (값 키울수록 부드럽게)
                            spreadRadius: 0, // 바깥으로 확장
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          context.go('/blood-pressure/info');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 14,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 67.w,
                                        height: 32.h,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 24.w,
                                              height: 24.h,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                    ),
                                                child: Image.asset(
                                                  "assets/icon/heart-blood.png",
                                                  width: 24.w,
                                                  height: 16.h,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text(
                                                "혈압",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Pretendard",
                                                  color: Colors.black,
                                                  height: 32 / 16,
                                                  letterSpacing: -0.4,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 4,
                                                top: 12.5,
                                                bottom: 12.5,
                                              ),
                                              child: SvgPicture.asset(
                                                "assets/icon/ellipse.svg",
                                                width: 7.w,
                                                height: 7.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          "고혈압1기",
                                          style: TextStyle(
                                            color: Color(0xffC7503D),
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            height: 6 / 10,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: SizedBox(
                                          // width: 60,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.5,
                                          height: 11,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "2025.08.15",
                                              style: TextStyle(
                                                color: Color(0xff626262),
                                                fontFamily: "Pretendard",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                height: 6 / 10,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 22,
                                      right: 46,
                                    ),
                                    width: 60.w,
                                    height: 20.h,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "수축기 혈압",
                                      style:
                                          TextStyleCustom.homeBloodBoxTextStyle(),
                                    ),
                                  ),
                                  Container(
                                    width: 60.w,
                                    height: 20.h,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "이완기혈압",
                                      style:
                                          TextStyleCustom.homeBloodBoxTextStyle(),
                                    ),
                                  ),
                                  Container(
                                    width: 60.w,
                                    height: 20.h,
                                    margin: EdgeInsets.only(left: 51),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "맥박",
                                      style:
                                          TextStyleCustom.homeBloodBoxTextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12.5),
                                  width: 79.w,
                                  height: 22.h,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "148",
                                          style:
                                              TextStyleCustom.homeBloodTextNumber(),
                                        ),
                                        Text(
                                          " mmHg",
                                          style:
                                              TextStyleCustom.homeBloodTextmmHg(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 32),
                                  width: 79.w,
                                  height: 22.h,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "88",
                                          style:
                                              TextStyleCustom.homeBloodTextNumber(),
                                        ),
                                        Text(
                                          " mmHg",
                                          style:
                                              TextStyleCustom.homeBloodTextmmHg(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // mmHg 혈압
                                Container(
                                  margin: EdgeInsets.only(left: 32),
                                  width: 79.w,
                                  height: 22.h,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "70",
                                          style:
                                              TextStyleCustom.homeBloodTextNumber(),
                                        ),
                                        Text(
                                          " bpm",
                                          style:
                                              TextStyleCustom.homeBloodTextmmHg(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // 전에 측정하고 최근에 측정한 값 비교
                            Container(
                              width: 268,
                              height: 8,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 112,
                                    top: 0,
                                    child: Container(
                                      width: 48,
                                      height: 8,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        spacing: 4,
                                        children: [
                                          SvgPicture.asset("assets/icon/polygon.svg"),
                                          Text(
                                            '6.0 mmHg',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: const Color(0xFFFF7F74),
                                              fontSize: 8,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 0.75,
                                              letterSpacing: -0.20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 215,
                                    top: 0,
                                    child: Container(
                                      width: 41,
                                      height: 8,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        spacing: 4,
                                        children: [
                                          SvgPicture.asset("assets/icon/polygon.svg"),
                                          Text(
                                            '6.0 bpm',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: const Color(0xFFFF7F74),
                                              fontSize: 8,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 0.75,
                                              letterSpacing: -0.20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 48,
                                      height: 8,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        spacing: 4,
                                        children: [
                                          SvgPicture.asset("assets/icon/polygon.svg"),

                                          Text(
                                            '6.0 mmHg',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: const Color(0xFFFF7F74),
                                              fontSize: 8,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 0.75,
                                              letterSpacing: -0.20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 하단 바
          BottomBar(),
          SizedBox(height: 34.h),
        ],
      ),
    );
  }
}
