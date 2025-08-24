import 'package:flutter/material.dart';
import 'package:novel/component/bottom-bar.dart';
import 'package:novel/component/text-colors.dart';
import 'package:novel/component/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';
import 'package:novel/primary-color.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: 200,
              color: Color(0xFF227EFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    width: 327,
                    height: 115,
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
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/icon/blood-pressure.png",
                                              width: 24,
                                              height: 16,
                                            ),
                                            Text(
                                              "혈압",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Image.asset(
                                                "assets/images/icon/ellipse.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          child: Text(
                                            "고혈압1기",
                                            style: TextStyle(
                                              color: Color(0xffC7503D),
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
                                                style: TextStyle(fontSize: 10, color: PrimaryColor.gray),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 10,
                                  ),
                                  // padding: const EdgeInsets.only(),
                                  child: SizedBox(
                                    width: 127,
                                    height: 48,
                                    child: Column(
                                      children: [
                                        TextWidgetColors.grayTextWidget(
                                          text: '수축기 혈압',
                                          color: PrimaryColor.gray,
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
                                        TextWidgetColors.grayTextWidget(
                                          text: '이완기 혈압',
                                          color: PrimaryColor.gray,
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
                                        TextWidgetColors.grayTextWidget(
                                          text: '맥박',
                                          color: PrimaryColor.gray,
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
          SizedBox(height: 34),
        ],
      ),
    );
  }
}
