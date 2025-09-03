import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/common/bottom-bar.dart';
import 'package:novel/component/text-colors.dart';
import 'package:novel/component/home-screen/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/home-screen/notice.dart';
import '../component/home-screen/user-profile.dart';

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
                Container(
                  width: 327.w,
                  height: 115.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25), // ✅ 회색 그림자
                        offset: Offset(4, 4), // x=4, y=4
                        blurRadius: 4, // 블러 4
                        spreadRadius: 0, // 스프레드 0
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,

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
                                          MediaQuery.of(context).size.width *
                                          0.5,
                                      height: 11,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 90,
                                          height: 10,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '2025.08.15',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFF505050),
                                                  fontSize: 10,
                                                  fontFamily: 'Pretendard',
                                                  height: 0.06,
                                                ),
                                              ),
                                            ],
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
                        Container(
                          margin: EdgeInsets.only(top: 11),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 22),
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Text(
                                        '수축기혈압',
                                        style: TextStyle(
                                          color: const Color(0xFF505050),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 52),
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Text(
                                        '이완기혈압',
                                        style: TextStyle(
                                          color: const Color(0xFF505050),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 51),
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Text(
                                        '맥박',
                                        style: TextStyle(
                                          color: const Color(0xFF505050),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12.5),
                              width: 76.w,
                              height: 22.h,
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '148',
                                            style: TextStyle(
                                              color: const Color(0xFF111111),
                                              fontSize: 20,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                              letterSpacing: -0.50,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: const Color(0xFF111111),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                              height: 1.83,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'mmHg ',
                                            style: TextStyle(
                                              color: const Color(0xFF505050),
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.57,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 34),
                              width: 80,
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '88',
                                          style: TextStyle(
                                            color: const Color(0xFF111111),
                                            fontSize: 20,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                            height: 1.10,
                                            letterSpacing: -0.50,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: const Color(0xFF111111),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            height: 1.83,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'mmHg ',
                                          style: TextStyle(
                                            color: const Color(0xFF505050),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.57,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // bpm 맥박
                            Container(
                              margin: EdgeInsets.only(left: 31),
                              width: 80,
                              height: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '70',
                                          style: TextStyle(
                                            color: const Color(0xFF111111),
                                            fontSize: 20,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                            height: 1.10,
                                            letterSpacing: -0.50,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: const Color(0xFF111111),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            height: 1.83,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'bpm ',
                                          style: TextStyle(
                                            color: const Color(0xFF505050),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.57,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // 전에 측정하고 최근에 측정한 값 비교
                        Container(
                          width: double.infinity,
                          height: 8.h,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 28),
                                width: 48.w,
                                height: 8.h,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4),
                                      child: SvgPicture.asset(
                                        "assets/icon/polygon.svg",
                                      ),
                                    ),
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
                              Container(
                                margin: EdgeInsets.only(left: 64),
                                width: 48.w,
                                height: 8.h,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4),
                                      child: SvgPicture.asset(
                                        "assets/icon/polygon.svg",
                                      ),
                                    ),
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
                              Container(
                                margin: EdgeInsets.only(left: 67),
                                width: 48.w,
                                height: 8.h,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4),
                                      child: SvgPicture.asset(
                                        "assets/icon/polygon.svg",
                                      ),
                                    ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 하단 바
          BottomBar(location: 'home'),
          SizedBox(height: 34.h),
        ],
      ),
    );
  }
}
