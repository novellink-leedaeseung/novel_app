import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/common/bottom-bar.dart';
import 'package:novel/component/home-screen/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';

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
                        // 혈압, 고혈압1기, 날짜
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12, top: 12),
                                  width: 303.w,
                                  height: 32.h,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 110.w,
                                        height: 32.h,
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        width: 24,
                                                        height: 16,
                                                        child: Image.asset(
                                                          "assets/icon/heart-blood.png",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  child: Text(
                                                    '혈압',
                                                    style: TextStyle(
                                                      color: const Color(
                                                        0xFF111111,
                                                      ),
                                                      fontSize: 16,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 2,
                                                      letterSpacing: -0.40,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: ShapeDecoration(
                                                    color: const Color(
                                                      0xFFC7503D,
                                                    ),
                                                    shape: OvalBorder(),
                                                  ),
                                                ),
                                                Container(
                                                  width: 50.w,
                                                  height: 15.h,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(
                                                      0xFFFEEAE2,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    spacing: 10,
                                                    children: [
                                                      Text(
                                                        '고혈압1기',
                                                        style: TextStyle(
                                                          color: const Color(
                                                            0xFFE5621C,
                                                          ),
                                                          fontSize: 10,
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.60,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 103),
                                        width: 90,
                                        height: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 10,
                                          children: [
                                            Text(
                                              '2025.08.15',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(0xFF505050),
                                                fontSize: 10,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 0.60,
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
                          ],
                        ),
                        // 혈압
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 22, top: 3),
                              width: 283.w,
                              height: 20.h,
                              child: Row(
                                children: [
                                  // 수축기 혈압
                                  Container(
                                    width: 60.w,
                                    height: 20.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
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
                                  // 이완기 혈압
                                  Container(
                                    margin: EdgeInsets.only(left: 52),
                                    width: 60.w,
                                    height: 20.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
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
                                  // 맥박
                                  Container(
                                    margin: EdgeInsets.only(left: 51),
                                    width: 60.w,
                                    height: 20.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
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
                            ),
                          ],
                        ),

                        // 수치 표현
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              width: 303.w,
                              height: 25.h,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 25.h,
                                    child: Text.rich(
                                      textAlign: TextAlign.center,
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
                                            text: 'mmHg',
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
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 32),
                                    width: 80.w,
                                    height: 25.h,
                                    child: Text.rich(
                                      textAlign: TextAlign.center,
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
                                            text: 'mmHg',
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
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 31),
                                    width: 80.w,
                                    height: 25.h,
                                    child: Text.rich(
                                      textAlign: TextAlign.center,
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
                                            text: 'bpm',
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // 서로 비교한 혈압 표시
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 28, top: 4),
                              height: 8.h,
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icon/polygon.svg",
                                          width: 8,
                                          height: 8,
                                        ),
                                        SizedBox(width: 4),
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
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icon/polygon.svg",
                                          width: 8,
                                          height: 8,
                                        ),
                                        SizedBox(width: 4),
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
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icon/polygon.svg",
                                          width: 8,
                                          height: 8,
                                        ),
                                        SizedBox(width: 4),
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
