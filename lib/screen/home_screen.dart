import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:novel/component/common/bottom-bar.dart';
import 'package:novel/component/home-screen/welcome-banner.dart';
import 'package:novel/iPhone_top.dart';

import '../component/home-screen/blood_pressure_card_widget.dart';
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
                BloodPressureCard(
                  dateText: '2025.08.15',
                  statusText: '고혈압1기',
                  systolicText: '148',
                  diastolicText: '88',
                  pulseText: '70',
                  systolicDiffText: '6.0 mmHg',
                  diastolicDiffText: '6.0 mmHg',
                  pulseDiffText: '6.0 bpm',
                  onPressed: () {
                    context.go('/blood-pressure/info');
                  },
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
