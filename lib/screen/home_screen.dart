import 'package:flutter/material.dart';
import 'package:novel/component/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';

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
          // 혈압, 체중
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 24,
                  ),
                  child: SizedBox(
                    width: 327,
                    height: 90,
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
                                child: Text(
                                  "공지사항",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 11,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 26,
                                child: Text(
                                  "근로자의 날 오픈기념으로 이벤트 진행합니다!",
                                  style: TextStyle(
                                    color: Color(0xff227eff),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
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
          ),
          // 하단 바
          Padding(
            padding: const EdgeInsets.only(left: 44.92, right: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/icon/home.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/icon/combined-shape.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/icon/calendar.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/icon/setting.png"),
                ),
              ],
            ),
          ),
          SizedBox(height: 34),
        ],
      ),
    );
  }
}
