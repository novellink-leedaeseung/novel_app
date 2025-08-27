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
                                                padding: const EdgeInsets.symmetric(
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
                                              padding: const EdgeInsets.only(left: 4),
                                              child: Text(
                                                "혈압",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Pretendard",
                                                  color: Colors.black,
                                                  height: 32/16,
                                                  letterSpacing: -0.4,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 4, top: 12.5, bottom: 12.5),
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
                                        padding: const EdgeInsets.only(
                                          left: 6,
                                        ),
                                        child: Text(
                                          "고혈압1기",
                                          style: TextStyle(
                                            color: Color(0xffC7503D),
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            height: 6/10,
                                            letterSpacing: 0
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
                                                height: 6/10,
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
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 10,
                                  ),
                                  child: SizedBox(
                                    width: 127,
                                    height: 48,
                                    child: Column(
                                      children: [
                                        Text(
                                          "수축기 혈압",
                                          style: TextWidgetColors.homeBloodBoxTextStyle(),

                                        ),
                                        Text(
                                          '148 mmHg',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 127,
                                    height: 48,
                                    child: Column(
                                      children: [
                                        Text(
                                          "이완기 혈압",
                                          style: TextWidgetColors.homeBloodBoxTextStyle(),
                                        ),
                                        Text(
                                          '88 mmHg',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 48,
                                    child: Column(
                                      children: [
                                        Text(
                                          "맥박",
                                          style: TextWidgetColors.homeBloodBoxTextStyle(),
                                        ),
                                        Text(
                                          '70 bpm',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
