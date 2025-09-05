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
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      body: Column(
        children: [
          // 안전 영역 + 헤더
          SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF227EFF),
              padding: EdgeInsets.only(bottom: 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const UserProfile(),
                  const WelcomeBanner(),
                ],
              ),
            ),
          ),

          // 스크롤 영역
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Notice(),
                BloodPressureCard(
                  dateText: '2025.08.15',
                  statusText: '고혈압1기',
                  systolicText: '148',
                  diastolicText: '88',
                  pulseText: '70',
                  systolicDiffText: '6.0 mmHg',
                  diastolicDiffText: '6.0 mmHg',
                  pulseDiffText: '6.0 bpm',
                  onPressed: () => context.go('/blood-pressure/info'),
                ),
              ],
            ),
          ),

          // 하단 바
          const BottomBar(location: 'home'),
          SizedBox(height: 34.h),
        ],
      ),
    );
  }
}
